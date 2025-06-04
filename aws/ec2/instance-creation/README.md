# AWS EC2 Instance Creation Guide

This document summarizes the key steps and configurations used to create an AWS EC2 instance for learning and experimentation.

---

## Instance Details

| Parameter          | Value                                                        |
|--------------------|--------------------------------------------------------------|
| **Instance Name**  | TEST Instance                                                |
| **AMI Name**       | ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305 |
| **AMI ID**         | ami-0e35ddab05955cf57                                       |
| **Instance Type**  | t2.micro                                                    |
| **Key Pair Name**  | TEST 01                                                    |

---

## Step-by-Step Instructions

1. **Login to AWS Console**
   - Navigate to the EC2 service.

2. **Launch Instance**
   - Click "Launch Instance".
   - Enter instance name as **TEST Instance**.
   - Select the AMI:
     - Search for `ubuntu-noble-24.04-amd64-server-20250305` or use AMI ID `ami-0e35ddab05955cf57`.
   - Choose instance type:
     - Select **t2.micro** (eligible for free tier).

3. **Configure Key Pair**
   - Create a new key pair named **TEST 01**.
   - Download the private key file (`.pem`).
   - Set permissions:  
     ```bash
     chmod 400 TEST01.pem
     ```

4. **Configure Security Groups**
   - Allow SSH (port 22) from your IP address.

5. **Launch and Connect**
   - Review and launch the instance.
   - Use SSH to connect:
     ```bash
     ssh -i "TEST01.pem" ubuntu@<public-ip-address>
     ```

---

## Notes and Tips

- Use official Ubuntu AMIs to ensure security and stability.
- `t2.micro` is suitable for light workloads and testing.
- Secure your private key and never share it.
- Always configure security groups carefully.

---

## References

- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [SSH Access to EC2 Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html)
