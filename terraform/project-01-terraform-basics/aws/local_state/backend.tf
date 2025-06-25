terraform {
  backend "s3" {
    bucket         = "211125365732-terraform-states"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

