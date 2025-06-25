# ------------------------------------------------------------------------------------------------
# CREATE AN S3 BUCKET AND DYNAMODB TABLE TO USE AS A TERRAFORM BACKEND
# This will store Terraform state files remotely and manage locking
# ------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ------------------------------------------------------------------------------------------------
# PROVIDER CONFIGURATION
# ------------------------------------------------------------------------------------------------

provider "aws" {
  region = "ap-south-1" # Mumbai Region
}

# ------------------------------------------------------------------------------------------------
# FETCH ACCOUNT DETAILS TO MAKE BUCKET NAME GLOBALLY UNIQUE
# ------------------------------------------------------------------------------------------------

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

# ------------------------------------------------------------------------------------------------
# CREATE THE S3 BUCKET FOR REMOTE STATE
# ------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${local.account_id}-terraform-states"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "terraform-remote-state"
    Environment = "dev"
  }
}

# ------------------------------------------------------------------------------------------------
# CREATE THE DYNAMODB TABLE FOR STATE LOCKING
# ------------------------------------------------------------------------------------------------

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock-table"
    Environment = "dev"
  }
}

