# 🚑 Troubleshooting – AWS Resource Lister Script

This guide lists common issues users may face while using `aws_resource_list.sh`, and their solutions.

---

## ❌ AWS CLI: Command Not Found

**Error:**
`aws: command not found`

**Description:**  
This error occurs when the AWS CLI is not installed on your system.

**Solution:**  
Install AWS CLI using the following command:

```bash
sudo apt update
sudo apt install awscli -y
```
---
## ❌ Error: AWS CLI is not configured

**Description:**  
This error occurs when the AWS CLI has not been configured and cannot find the required credential and config files.

**Error Message:**
`AWS CLI is not configured. Please configure the AWS CLI and try again.`


**Cause:**  
Missing files:
- `~/.aws/credentials`
- `~/.aws/config`

**Solution:**  
Run the following command to configure AWS CLI:

```bash
aws configure
```

provide the following when prompted:
```
AWS Access Key ID
AWS Secret Access Key
Default region name (optional)
Default output format (json / text / table)
```
---

## ❌ Error: Invalid AWS Service Name

**Description:**  
The entered AWS service name is not recognized by the script.

**Error Message:**
❌ Invalid service: xyz
✅ Valid services: ec2, rds, s3, cloudfront, vpc, iam, route53, cloudwatch, cloudformation, lambda, sns, sqs, dynamodb, ebs


**Cause:**  
A typo or unsupported service name was passed as the second argument to the script.

**Solution:**  
Make sure to use a valid, lowercase service name from the list of supported services:
- ec2, rds, s3, cloudfront, vpc, iam, route53, cloudwatch,cloudformation, lambda, sns, sqs, dynamodb ,ebs

> 💡 Tip: Run `./aws_resource_list.sh us-east-1 help` (if you add such a feature) or refer to the README for supported services.

---

## ❌ Error: Missing Required Arguments

**Description:**  
This occurs when the script is executed without passing both the required arguments: AWS region and service name.

**Error Message:**
Usage: ./aws_resource_list.sh <aws_region> <aws_service>
Example: ./aws_resource_list.sh us-east-1 ec2


**Cause:**  
The user did not provide both command-line arguments.

**Solution:**  
Run the script with the correct syntax:


### 🐞 Script Doesn’t Run?

**Cause:**
- Script does not have execute permissions.

**Fix:**

```bash
chmod +x aws_resource_list.sh
./aws_resource_list.sh <region> <service>
```

Example:
```bash
./aws_resource_list.sh us-east-1 ec2
```
> 💡 Both parameters are mandatory for the script to function properly.

### 📉 Empty or Blank Output?

**Cause:**
- No resources exist in the specified region for the selected service.
- IAM user lacks necessary permissions.

**Fix:**
- ✅ Ensure that AWS resources actually exist in the specified region.
- ✅ Confirm correct IAM policies are attached to the IAM user (e.g., `AmazonEC2ReadOnlyAccess`, `AmazonS3ReadOnlyAccess`, etc.).

