# 📄 Terraform File: `main.tf` (Local Backend)

This file defines the **core infrastructure logic** for provisioning an EC2 instance on AWS using Terraform. It is part of the `local_state` directory under the project `project-01-terraform-basics`, which focuses on storing state files locally.

---

## 🔧 Purpose

* Provision a **single EC2 instance** in the `ap-south-1` region.
* Tag the instance as `Terraform_Demo`.
* Output the public IP address of the instance after creation.

---

## 📦 File Location

```bash
DevOps-AWS/terraform/project-01-terraform-basics/aws/local_state/main.tf
```

---

## 🧱 Terraform Block

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}
```

### ✅ Purpose:

* Ensures the correct version of the **AWS provider** is used (`~> 5.0`)
* Enforces Terraform version compatibility (`>= 1.3.0`)

---

## 🌍 Provider Block

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

### ✅ Purpose:

* Configures Terraform to deploy resources in the **Mumbai (ap-south-1)** AWS region.
* Uses default credentials from `aws configure` or environment variables.

---

## 💻 Resource Block – EC2 Instance

```hcl
resource "aws_instance" "app_server" {
  ami           = "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}
```

### ✅ Purpose:

* Provisions a **t2.micro EC2 instance** using the specified **Amazon Linux AMI**.
* Adds a Name tag (`Terraform_Demo`) for easy identification in the AWS console.

> ℹ️ `t2.micro` is eligible for AWS Free Tier.

> ⚠️ Replace AMI ID if outdated or unavailable in your region.

---

## 📤 Output Block

```hcl
output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}
```

### ✅ Purpose:

* Displays the **public IP address** of the created EC2 instance after execution.
* Helps verify connectivity or reference the instance externally.

---

## 🧪 Sample Execution Output

After running `terraform apply`:

```bash
Outputs:
instance_public_ip = "13.233.111.101"
```

---

## 🧠 Key Learnings

* Basic EC2 provisioning using Terraform
* Understanding provider and resource blocks
* Capturing outputs for real-world usage

---

## 📌 Notes

* This configuration is used with **local state management** only.
* Do not commit the generated `terraform.tfstate` to version control.
* Include `.terraform.lock.hcl` to lock provider versions.

---

✨ Ready for use in solo testing, learning, or sandbox demos.

---

# 📄 Terraform File: `backend.tf` (Remote Backend Configuration for Local State Setup)

This file configures the **remote backend** for Terraform using **AWS S3** and **DynamoDB**. It tells Terraform **where and how to store the state file** and how to handle **state locking** to avoid conflicts during collaborative operations.

---

## 🔧 Purpose

- Configure **remote backend** for storing `.tfstate` file in an **S3 bucket**.
- Enable **locking and consistency** using a **DynamoDB table**.
- Separate state management from resource provisioning for cleaner architecture.

---

## 📦 File Location

```bash
DevOps-AWS/terraform/project-01-terraform-basics/aws/local_state/backend.tf
```
---
## ⚙️ Backend Configuration
```bash

terraform {
  backend "s3" {
    bucket         = "211125365732-terraform-states"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
```
---
### ✅ Explanation of Fields

| Field           | Description                                                                                      |
|-----------------|--------------------------------------------------------------------------------------------------|
| `bucket`        | Name of the **S3 bucket** to store the remote state. Must be **globally unique**.               |
| `key`           | Path (within the bucket) to the `.tfstate` file. Supports organizing different **environments**. |
| `region`        | AWS region where the **backend resources** (S3 + DynamoDB) are located.                         |
| `dynamodb_table`| Name of the **DynamoDB table** used for **state locking** to prevent race conditions.            |
| `encrypt`       | Ensures the state file is stored **encrypted at rest**.                                          |

---
## 🧠 Why This Matters

- Prevents **"double apply" issues** by locking the state file during runs.
- Allows for **team collaboration** and **CI/CD pipelines** without conflict.
- Ensures **secure, centralized, and consistent state management**.

---

## 🔒 Backend Resources Used

This configuration depends on the following pre-created AWS resources:

- ✅ **S3 Bucket**: `211125365732-terraform-states`
- ✅ **DynamoDB Table**: `terraform-lock`

> ⚠️ These must be created **before** running `terraform init` with this backend config.

You can create them using the configuration provided in:

```bash
DevOps-AWS/terraform/project-01-terraform-basics/aws/remote_state/main.tf
```
---
## 🧪 Usage Flow
```bash

cd aws/local_state
terraform init     # Initializes with the configured remote backend
terraform apply    # Applies and saves state remotely
```
> During init, Terraform will:
Connect to the S3 bucket
Check for existing state
Lock the state using DynamoDB <


---

## 📌 Notes

- 🔄 `terraform init` must be **re-run** after editing `backend.tf`.
- 🔐 Never **hardcode secrets or credentials**; use `aws configure` or environment variables.
- 🚫 Avoid committing:
  - `.terraform/`
  - `.terraform.lock.hcl`
  - `.tfstate` and `.tfstate.backup` files  
  to version control (add them to `.gitignore`).
---
