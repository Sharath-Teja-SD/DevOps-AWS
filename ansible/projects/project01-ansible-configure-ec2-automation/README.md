# 🧰 Project: Ansible Configure EC2 Automation

Automate the configuration of EC2 instances using Ansible — from control node setup to remote target configuration. This project demonstrates real-world DevOps automation including passwordless SSH setup, ad-hoc Ansible tasks, and structured playbooks with roles.

---

## 🏗️ Project Architecture

```text
                   +-----------------------------+
                   |      Ansible Control EC2     |
                   |  (Ubuntu, Public IP Access)  |
                   |     - ansible installed      |
                   |     - ssh-keygen setup       |
                   |     - inventory file         |
                   +-------------+---------------+
                                 |
                                 | SSH (private IP + authorized_keys)
                                 v
                 +------------------------------+
                 |    Target EC2 Instance(s)     |
                 |  (Ubuntu, Private IP Access)  |
                 |   - Receives Ansible commands |
                 +------------------------------+
```
---

## 🔧 Prerequisites

Before getting started, ensure you have the following:

- ✅ **AWS Account** with permission to launch EC2 instances
- ✅ Basic understanding of:
  - **Ansible**
  - **SSH Keys**
  - **Linux Terminal**
- ✅ **Key Pair (PEM file)** for SSH access to the EC2 instance
- ✅ Properly configured **Inbound Rules** in your EC2 Security Group:
  - **SSH (Port 22)** – for remote terminal access
  - **HTTP (Port 80)** – for NGINX verification or web-based checks
---
## 🚀 Step-by-Step Setup

### 1️⃣ Create EC2 Instances

Provision **2 Ubuntu EC2 instances**:

- `ansible-control` → with **public IP**
- `ansible-target` → with **private or public IP**

🔐 Use the **same Key Pair (PEM file)** for both instances.

---

### 2️⃣ Setup Ansible on Control EC2

Run the following on your **control node**:

```bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install ansible -y
ansible --version
```
---
# 🔐 Passwordless SSH Setup between Ansible Control and Target Nodes

This section explains how to generate SSH keys on the control node, copy them to the target node, and validate passwordless SSH connectivity.

---

## 3️⃣ Generate SSH Keys (on Control Node)

Run the following on the **control node**:

```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub
```
>💡 This generates a public/private SSH key pair. Copy the contents of the id_rsa.pub file.
---
## 4️⃣ Setup Passwordless SSH (on Target Node)
>From the control node:
```bash
ssh ubuntu@<target-public-ip>
```
>Then, on the target node:
```bash
mkdir -p ~/.ssh
vim ~/.ssh/authorized_keys
# Paste the contents of id_rsa.pub from the control node
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```
>📝 Ensure that permissions are set correctly for secure SSH access.

---
## 5️⃣ Validate SSH from Control to Target
>On the control node, test SSH access to the target:

```bash

ssh ubuntu@<target-private-ip>
```
> ✅ If no password is asked and you're logged in successfully, passwordless SSH is working!

🎉 You're now ready to run Ansible commands and playbooks from your control node to your target node without being prompted for a password!

---
## 📂 Project Directory Structure
text
```
project01-ansible-configure-ec2-automation/
│
├── inventory                  # Inventory file with target IPs
├── first-playbook.yml        # Basic playbook to install and start NGINX
├── second-playbook/          # Advanced playbook with Ansible roles
│   └── kubernetes/           # Example role generated via Ansible Galaxy
│       ├── tasks/
│       ├── handlers/
│       ├── templates/
│       ├── files/
│       └── ...
└── README.md                 # Project documentation
```
---
## 📋 Sample Inventory File
```
[webservers]
172.31.3.127 ansible_user=ubuntu

[dbservers]
<add-db-private-ip> ansible_user=ubuntu
```
---

## ⚡ Ansible Ad-Hoc Command Examples
```bash

# Touch a file
ansible -i inventory all -m shell -a "touch devopsclass"

# Check CPU cores
ansible -i inventory all -m shell -a "nproc"

# Check disk usage
ansible -i inventory all -m shell -a "df -h"
```
---

## 📦 Ansible Playbook: Install & Start NGINX
 # first-playbook.yml

```yaml
---
- name: Install and start NGINX
  hosts: all
  become: true

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present

    - name: Start nginx
      service:
        name: nginx
        state: started
        enabled: true
```
> Run with:

```bash

ansible-playbook -i inventory first-playbook.yml
```
## 📁 Role Directory (Auto-Generated)
```bash
ansible-galaxy role init kubernetes
```
> Creates:

```text
kubernetes/
├── tasks/
├── handlers/
├── templates/
├── files/
├── vars/
├── defaults/
├── meta/
└── README.md

```

> Use with:
```
yaml

- hosts: all
  roles:
    - kubernetes
```
---

### 🧪 Troubleshooting
## 🐞 SSH Permission Denied?
Ensure <.ssh/authorized_keys> is correct

File permission:

```bash
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```

## 🐞 Ansible Module Errors?
Check YAML spacing (use 2 spaces)

Avoid conflicting keys:

yaml
```
apt:
  name: nginx
  state: present
```
## 🐞 HTTP not working?
Allow port 80 in security group

Check NGINX status:

```bash

sudo systemctl status nginx
```

## 🔗 Useful Resources

Here are some references and learning materials that helped during this project:

### 📘 Official Documentation & Examples
- [Ansible Documentation](https://docs.ansible.com/)
- [Ansible Galaxy (Community Roles)](https://galaxy.ansible.com/)
- [Ansible Examples Repository (GitHub)](https://github.com/ansible/ansible-examples)

### 🎥 YouTube Learning Series
- [🔧 DevOps with Ansible - Playlist](https://www.youtube.com/playlist?list=PLdpzxOOAlwvIKMhk8WhzN1pYoJ1YU8Csa)
- [🚀 EC2 Setup with Ansible (Video 1)](https://www.youtube.com/watch?v=I5_NF8nvACg&list=PLdpzxOOAlwvIKMhk8WhzN1pYoJ1YU8Csa&index=20)
- [📁 Ansible Role Creation & Structure (Video 2)](https://www.youtube.com/watch?v=Z6T2r3Xhk5k&list=PLdpzxOOAlwvIKMhk8WhzN1pYoJ1YU8Csa&index=25)

---

💬 Author
Made with ❤️ by a DevOps enthusiast learning real-world automation!

---
