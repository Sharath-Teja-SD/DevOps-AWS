#!/bin/bash

###################################################
# Author  : Naruto
# Date    : [Add Date Here]
# Version : 1.0
#
# This script will report AWS resource usage:
# - AWS S3
# - AWS EC2
# - AWS Lambda
# - AWS IAM Users
# It will also schedule itself to run daily at 7:00 PM.
###################################################

# 🔧 Debug mode (shows executed commands)
set -x

# 📁 Output and log file paths
output_file="/home/ubuntu/resourcestrackers.txt"
log_file="/home/ubuntu/aws_cron_log.txt"

# 🔄 Clear the previous output
> "$output_file"

# 🪣 List S3 Buckets
echo "🔹 Print list of S3 Buckets" >> "$output_file"
aws s3 ls >> "$output_file"

# 🖥️ List EC2 Instances (only IDs)
echo -e "\n🔹 Print list of EC2 Instance IDs" >> "$output_file"
aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId' >> "$output_file"

# ⚙️ List Lambda Functions
echo -e "\n🔹 Print list of Lambda Functions" >> "$output_file"
aws lambda list-functions >> "$output_file"

# 👤 List IAM Users
echo -e "\n🔹 Print list of IAM Users" >> "$output_file"
aws iam list-users >> "$output_file"

# ⏲️ Set up a cron job (one-time setup)
cron_cmd="0 19 * * * /home/ubuntu/aws_resource_tracker.sh >> $log_file 2>&1"

# ✅ Add cron job if not already present
if ! crontab -l 2>/dev/null | grep -Fq "$cron_cmd"; then
  (crontab -l 2>/dev/null; echo "$cron_cmd") | crontab -
  echo -e "\n✅ Cron job added: Script will run daily at 7:00 PM" >> "$output_file"
else
  echo -e "\nℹ️ Cron job already exists" >> "$output_file"
fi
