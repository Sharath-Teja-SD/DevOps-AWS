# Jenkins EC2 + Docker Agent Setup

This project demonstrates how to:
- Install Jenkins on an EC2 Ubuntu instance
- Expose Jenkins to the outside world
- Configure Docker as a build agent
- Create a Jenkins pipeline project using GitHub SCM

---

## 🌐 Jenkins Public URL

Access Jenkins: [http://3.108.52.63:8080](http://3.108.52.63:8080)

---

## 🚀 Setup Summary

### 🔹 EC2 & SSH

```bash
ssh -i "YOUR-PEM-FILE.pem" ubuntu@<ec2-public-ip>
```
---
Sure! Here's the exact same content formatted properly in Markdown (`.md`) syntax:


## 🔹 Install Java (Pre-requisite)

```bash
sudo apt update
sudo apt install openjdk-17-jre
java -version
````

---

## 🔹 Install Jenkins

```bash
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```

---

## 🔹 Expose Jenkins (Port 8080)

Modify Inbound Rules in EC2 Security Group to allow:

* All traffic from `0.0.0.0/0`
  **OR**
* Just TCP on port `8080`

---

## 🔹 Retrieve Initial Admin Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
---

Here is your provided content converted **exactly** into proper Markdown (`.md`) format, preserving all sections, headings, and code blocks:


# 🐳 Docker Configuration for Jenkins

## 🔹 Install Docker

```bash
sudo apt update
sudo apt install docker.io
````

---

## 🔹 Add Jenkins & Ubuntu to Docker Group

```bash
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
```

---

## 🔹 Test Docker from Jenkins User

```bash
su - jenkins
docker run hello-world
```

---

## 🧪 Pipeline Project

### Jenkinsfile Example

```groovy
pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/YOUR-REPO-HERE.git'
            }
        }
        stage('Build') {
            steps {
                echo "Building app..."
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying app..."
            }
        }
    }
}
```

---

## 📌 Configure in Jenkins:

* **Project Type**: Pipeline
* **Definition**: Pipeline script from SCM
* **SCM**: Git
* **Repository URL**: your GitHub repo
* **Script Path**: Jenkinsfile

---

## 📦 Plugins Installed

* Docker Pipeline
* Docker Commons
* Authentication Tokens API
* Git Plugin

---

## 🛠 Useful Commands

### 🔁 Jenkins Restart

```bash
http://<ec2-ip>:8080/restart
```

### 📊 Process Status

```bash
ps -ef | grep jenkins
```

### 🐳 Docker Test

```bash
docker run hello-world
docker ps -a
```

---

## 🤖 Author

**Sharath Teja** – DevOps | AWS | Automation Enthusiast
*Inspired by: iam-veeramalla/Jenkins-Zero-To-Hero*

---

## ✅ Next Steps

* Create a Jenkins job to build & deploy Docker containers
* Trigger builds using GitHub webhook

---


