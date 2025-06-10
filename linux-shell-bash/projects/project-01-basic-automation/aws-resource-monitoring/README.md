# 📊 AWS Resource Monitoring Scripts

This project contains Bash scripts to monitor AWS resource usage (S3, EC2, Lambda, IAM) using AWS CLI, and optionally schedule reports using `cron`.

---

## 📁 Project Structure

| File/Folder                    | Description                                              |
|-------------------------------|----------------------------------------------------------|
| `scripts/aws_resource_tracker.sh`       | Script to manually list AWS resources via CLI            |
| `scripts/aws_resource_tracker_cronjob.sh` | Script to list AWS resources and schedule via cron       |
| `output/resourcestrackers.txt`          | Sample output file showing script execution result       |
| `install/install-aws-cli.sh`            | Script to install AWS CLI v2 on Ubuntu                   |

---

## 🧰 Prerequisites

- AWS EC2 Instance (Ubuntu)
- IAM User with permissions:
  - `s3:ListAllMyBuckets`
  - `ec2:DescribeInstances`
  - `lambda:ListFunctions`
  - `iam:ListUsers`
- AWS CLI installed
- `jq` installed

```bash
sudo apt update
sudo apt install jq curl unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```
---

## 📌 Notes

- ✅ Tested on **Ubuntu EC2 instance**
- 👤 IAM user must have the following **permissions**:
  - `s3:ListAllMyBuckets`
  - `ec2:DescribeInstances`
  - `lambda:ListFunctions`
  - `iam:ListUsers`
- ⚙️ Remember to **configure AWS CLI** before running the scripts:

```bash
aws configure
