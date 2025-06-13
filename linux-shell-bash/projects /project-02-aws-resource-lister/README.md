# 🚀 AWS Resource Lister (Interactive) – Shell Script Project

This project provides a CLI-based automation script to **list AWS resources interactively** across 14+ AWS services by specifying a region and service.

---

## 📌 Use Case

This tool is useful for:

- 🔍 Quick inspection of AWS resources per region/service  
- ✅ Learning AWS CLI with hands-on experience  
- 🔁 Scripting automation inside DevOps pipelines  

---

## 🧰 Prerequisites

### ✅ AWS CLI Installation

Install AWS CLI using `apt` package manager (Quick & Easy):

```bash
sudo apt update
sudo apt install awscli -y
```

After installation, configure AWS CLI by running:
```bash
aws configure
```

You will be prompted to enter:
```bash
Access Key ID
Secret Access Key
Default region (can leave empty)
Output format (json / text / table)
```
### ✅ AWS IAM Permissions

Ensure your IAM user has permissions for the following AWS services:

`EC2`, `RDS`, `S3`, `VPC`, `CloudWatch`, `CloudFront`, `CloudFormation`,  
`Lambda`, `Route53`, `IAM`, `SNS`, `SQS`, `DynamoDB`, `EBS`

🔐 SSH Access to EC2 Instance
To connect to your Ubuntu EC2 instance:

```bash
ssh -i /path/to/your-key.pem ubuntu@<EC2-Public-IP>
```
📌 Replace:

/path/to/your-key.pem → path to your downloaded .pem key

```<EC2-Public-IP>``` → public IP address of your EC2 instance

Make sure to set correct permissions for your key:

```bash

chmod 400 your-key.pem
```
Also, ensure that your security group allows inbound SSH on port 22.

---

## 🔧 Script Usage and Execution Flow

This section explains how to run the script and the logic it follows during execution.

### 📌 Example

```bash
./aws_resource_list.sh us-east-1 ec2


---

### 📘 Usage

Run the script with two required arguments:

```bash
./aws_resource_list.sh <aws_region> <aws_service>
```
---
### ⚙️ How It Works

This script follows a step-by-step execution flow:

---

#### 1. Accepts Two Command-Line Arguments:
- `aws_region`: AWS region (e.g., `us-east-1`)
- `aws_service`: AWS service name (e.g., `ec2`, `s3`, `lambda`, etc.)

---

#### 2. Performs Validation:
- ✅ Ensures AWS CLI is installed
- ✅ Checks if AWS CLI is configured
- ✅ Verifies that the service name is among supported options

---

#### 3. Processes the Request:
- Executes the appropriate `aws` CLI command based on the selected service and region

---

#### 4. Outputs:
- Displays the resource information in **JSON** format directly in the terminal

---

> **Note:** Invalid service names will trigger an error message along with a list of supported services.
