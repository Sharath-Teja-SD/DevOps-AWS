# 📄 Terraform File: `main.tf` (Remote State Infrastructure Setup)

This Terraform configuration provisions the required AWS resources to **enable remote state management**. It sets up an **S3 bucket for storing state files** and a **DynamoDB table for state locking**, ensuring collaboration safety and consistent infrastructure changes.

---

## 🔧 Purpose

* Provision **backend infrastructure** required by Terraform:
  - S3 bucket to **store `.tfstate`** files remotely.
  - DynamoDB table for **state locking and consistency**.
* Automatically create a **globally unique bucket name** using AWS account ID.

---

## 📦 File Location

```bash
DevOps-AWS/terraform/project-01-terraform-basics/aws/remote_state/main.tf
```

---

## 🧱 Terraform Block

```hcl
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

### ✅ Purpose:

* Enforces minimum Terraform version.
* Uses AWS provider from the official HashiCorp registry.

---

## 🌍 Provider Configuration

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

### ✅ Purpose:

* Specifies **Mumbai region** for provisioning the remote backend infrastructure.

---

## 🔍 Fetch AWS Account Info

```hcl
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}
```

### ✅ Purpose:

* Retrieves the AWS Account ID.
* Dynamically constructs a **globally unique bucket name**.

---

## 🪣 S3 Bucket Resource

```hcl
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
    Name        = "terraform-remote-state"
    Environment = "dev"
  }
}
```

### ✅ Purpose:

* Creates an S3 bucket with:
  - **Versioning** for historical state tracking.
  - **Server-side encryption** for security.
  - **Tags** for identification.

> 🛡️ Bucket name format: `<account_id>-terraform-states`

---

## 🗃️ DynamoDB Table Resource

```hcl
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-lock-table"
    Environment = "dev"
  }
}
```

### ✅ Purpose:

* Enables **state locking** and **prevents simultaneous operations** using:
  - Primary key `LockID`
  - On-demand billing
  - Tags for environment classification

---

## 🧪 Sample Execution Output

After `terraform apply`, you’ll see:

```bash
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

---

## 🧠 Key Learnings

* Automate creation of Terraform backend infra (S3 + DynamoDB)
* Use **data sources and locals** to dynamically build resource names
* Apply **encryption, versioning, and tagging** best practices

---

## 📌 Notes

* This module should be executed **before using `backend "s3"` configuration**.
* Run `terraform apply` to create these backend resources, then use their references in your `backend.tf`.
* Store this separately or protect it via workspace/environment if needed.

---

✨ This file sets the foundation for reliable and collaborative Terraform deployments.

---

# S3 backend for Terraform

> Copied verbatim from https://github.com/ozbillwang/terraform-best-practices

Createe a s3 bucket and dynamodb table to use as terraform backend.

* dynamodb_table_name = terraform-lock
* s3_bucket_name = <account_id>-terraform-states

# usage

```
# make sure you are on the right aws account
pip install awscli
aws s3 ls

# If you don't set default region in your aws configuration, and you want to create the resources in region "us-east-1"
export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=us-east-1

# Dry-run
terraform init
terraform plan

# apply the change
terraform apply
```
