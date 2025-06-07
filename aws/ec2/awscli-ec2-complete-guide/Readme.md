# 📘 AWS CLI + EC2 SSH Access Full Guide

This guide provides a step-by-step walkthrough to install and configure AWS CLI on Windows, create an EC2 instance, and connect to it using both the AWS Console UI and Windows Terminal (CLI).

---

## 📂 Guide Summary

| Section                        | Description                                           |
|-------------------------------|-------------------------------------------------------|
| AWS CLI Setup                 | Install and configure the CLI with Access/Secret Key |
| EC2 Instance Creation         | Launch a test EC2 instance (Ubuntu) from the console |
| SSH from Console              | Connect using EC2 Instance Connect (browser)         |
| SSH from Windows Terminal     | Connect from your local machine CLI using `.pem`     |
| Troubleshooting & Screenshots | Common fixes and connection screenshots              |

---

## 🔧 AWS CLI Setup

### 1. Install AWS CLI on Windows

- Download: [Install AWS CLI on Windows](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- Run the `.exe` installer

### 2. Verify Installation

```bash
aws --version
```

### 3. Configure AWS CLI

Run:

```bash
aws configure
```

Enter your credentials:

```
AWS Access Key ID [None]: <your-access-key-id>
AWS Secret Access Key [None]: <your-secret-access-key>
Default region name [None]: ap-south-1
Default output format [None]: json
```

---

## ✅ Verify Configuration

To confirm credentials are working:

```bash
aws sts get-caller-identity
```

Expected output:

```json
{
  "UserId": "AIDAEXAMPLE",
  "Account": "123456789012",
  "Arn": "arn:aws:iam::123456789012:user/your-iam-user"
}
```

---

## 💻 EC2 Instance Creation

### Instance Configuration

| Parameter          | Value                                                        |
|--------------------|--------------------------------------------------------------|
| **Instance Name**  | TEST Instance                                                |
| **AMI Name**       | Ubuntu 22.04 LTS                                             |
| **AMI ID**         | (Choose region-based official image)                         |
| **Instance Type**  | t2.micro (Free Tier)                                         |
| **Key Pair Name**  | TEST01                                                       |

### Launch Steps

1. Go to EC2 Dashboard → Launch Instance
2. Fill in:
   - Instance name
   - AMI: Ubuntu
   - Instance type: `t2.micro`
   - Key pair: Create new → Download `.pem`
   - Security Group: Allow SSH (port 22)
3. Launch instance

---

## 🖥️ Connect to EC2 Using AWS Console UI

1. Go to **EC2 > Instances > Select Instance**
2. Click **Connect**
3. Choose **EC2 Instance Connect**
4. Click **Connect** (opens in browser)

### 📸 Screenshot: EC2 Instance Connect via Console UI
  
![EC2 Connect Using Console UI](screenshots/ec2-connect-using-console-ui.JPG)

---


## 💻 Connect to EC2 from Windows Terminal

1. Move `.pem` file to a known folder (e.g., `D:\AWS\keys\`)
2. Open Windows Terminal or PowerShell
3. Set Permissions (Important!):

```bash
icacls "D:\AWS\keys\TEST01.pem" /inheritance:r
icacls "D:\AWS\keys\TEST01.pem" /grant:r "%username%:R"
```

4. Connect via SSH:

```bash
ssh -i "D:\AWS\keys\TEST01.pem" ubuntu@<your-ec2-public-ip>
```

---

## 🐞 Common Errors & Fixes

| Issue                              | Fix                                                                 |
|-----------------------------------|----------------------------------------------------------------------|
| Bad permissions on `.pem` file    | Use `icacls` as shown above                                          |
| `Permission denied (publickey)`   | Use correct username (e.g., `ubuntu`), and verify `.pem` path/IP     |
| AWS CLI not recognized            | Restart terminal or add AWS CLI to system PATH                      |
| `AccessDenied` in CLI commands    | Ensure IAM user permissions are correctly assigned                  |

---

## 📸 Screenshots

Here are some key screenshots of the process:

```markdown
![AWS CLI Config](screenshots/aws-configure.png)
![Access Key Created](screenshots/access-secret-keys.png)
![EC2 SSH from CLI](screenshots/ec2-ssh-login.png)
```

---

## 📁 Suggested Folder Structure

```
ec2-awscli-complete-guide/
├── README.md
├── screenshots/
│   ├── aws-configure.png
│   ├── access-secret-keys.png
│   ├── ec2-ssh-login.png
```

---

## 📘 References

- [AWS CLI Docs](https://docs.aws.amazon.com/cli/)
- [EC2 Access Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html)
- 🎥 [YouTube: EC2 + SSH Full Walkthrough](https://www.youtube.com/watch?v=NJkMe9cdYEQ)

---

## 🧠 Tips

- Use IAM user with limited scope access for security
- Never expose or upload `.pem` or access keys publicly
- Document CLI activities in a `log.md` or `notes.md` for future learning
