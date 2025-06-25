terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}


