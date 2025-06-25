#!/bin/bash

###################################################
#Authour : Naruto
#Date :
#
#Version
#
#This script will report the AWS resources usage
##################################################

set -x

#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users

#list S3 buckets
echo "Print list of S3buckets"
aws s3 ls

#list EC2 Instances
echo -e "\n Print list of EC2 Instances"
#aws ec2 describe-instances  #this 1st one give all the info about instances
aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId' #This give the just Ids of the EC2instances and Jq is used for jason to read format

#list lambda
echo "Print list of lambda functions"
aws lambda list-functions

#list IAM users
echo "Print list of IAM users"
aws iam list-users
