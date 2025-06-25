# 🐚 Shell Scripting Automation for VM Health Monitoring

## 📘 Use Case Overview

John is a DevOps Engineer at AWS. His responsibility includes monitoring the health status of **10,000 Virtual Machines (VMs)** daily. Performing this check manually is inefficient and error-prone.

To automate this process, John uses **Shell Scripting** and **Cron Jobs**, with all scripts stored in **Git** for version control and collaboration.

---

## 🔧 Use Case 1: Manual Execution via Shell Script

### 📋 Scenario

Instead of manually checking each VM's health one by one, John writes a **Shell Script** that automates the health check of all VMs. He stores this script in a Git repository and executes it whenever needed.

---

### 📁 Project Structure
```bash
vm-health-monitor/
├── check_vm_health.sh # 🧠 Main shell script to check VM health
├── vm_list.txt # 📄 Contains list of all VM IPs or hostnames
├── logs/ # 📁 Directory to store health logs
│ └── vm_health_YYYYMMDD.log # 📜 Log file generated with timestamp
└── README.md # 📘 Project documentation
```
---

---

### 🧠 Shell Script: `check_vm_health.sh`

```bash
#!/bin/bash

# Description: Checks health of all VMs listed in vm_list.txt

VM_LIST="vm_list.txt"
LOG_DIR="logs"
DATE=$(date +%Y%m%d)
LOG_FILE="$LOG_DIR/vm_health_$DATE.log"

mkdir -p "$LOG_DIR"
echo "VM Health Check - $DATE" > "$LOG_FILE"
echo "-------------------------" >> "$LOG_FILE"

while read -r VM; do
    echo "Checking VM: $VM"
    ping -c 2 "$VM" &> /dev/null
    if [ $? -eq 0 ]; then
        echo "$VM is UP" >> "$LOG_FILE"
    else
        echo "$VM is DOWN" >> "$LOG_FILE"
    fi
done < "$VM_LIST"

echo "Health check complete. Report saved to $LOG_FILE"
```
---
### 📘 How to Run Manually
```bash

chmod +x check_vm_health.sh
./check_vm_health.sh
```
---
## ⏰ Use Case 2: Automate Execution Using Cron Job

### 📋 Scenario

To ensure daily monitoring without manual intervention, **John sets up a cron job** that executes the health check script **daily at 9:00 AM**.  
If any VMs are found **down**, the script will **email the log file** to the DevOps team.

---

### 📬 Enhanced Script (with Mail): `check_vm_health.sh`

Add the following lines at the **end of the script** to email only when any VMs are down:

```bash
# Email only if any VMs are DOWN
if grep -q "DOWN" "$LOG_FILE"; then
    mail -s "⚠️ VM Health Alert - $DATE" admin@example.com < "$LOG_FILE"
fi
```
> 📝 Replace `admin@example.com` with your actual email address.  
> 📦 Make sure the `mail` package and mail server (like `mailutils` or `sendmail`) is configured properly on your system.

---
## ⏱️ Cron Job Setup

### 🔧 Open the Crontab Editor

To schedule the script automatically, open the crontab editor:

```bash
crontab -e
```
### 🕘 Add the Cron Job
Add the following line to schedule the script to run every day at 9:00 AM:

```bash
0 9 * * * /home/john/vm-health-monitor/check_vm_health.sh
```

### 💡 Make sure the script has executable permissions using:

```bash

chmod +x check_vm_health.sh
```
---
## ✅ Benefits

- 🔁 **Automation** of repetitive manual tasks  
- 📉 **Reduces human error**  
- 📬 **Alerting via email** when VMs go down  
- 📚 **Version controlled** via Git for better collaboration and tracking  

---

## 💡 Sample `vm_list.txt`

```text
192.168.1.10
192.168.1.11
192.168.1.12
```
---
### 📥 Git Integration (Optional)
Initialize the Git repository and push it to GitHub:

```bash

git init
git add .
git commit -m "Initial commit of VM health monitor script"
git remote add origin https://github.com/username/vm-health-monitor.git
git push -u origin main
```
🔄 Replace https://github.com/username/vm-health-monitor.git with your actual GitHub repo URL.

---

### 🧪 Improvements for Production
🔍 Replace ping with actual health API checks or SSH-based CPU/disk/memory monitoring

🔄 Add log rotation to prevent disk bloat

🔐 Use environment variables for sensitive data like email and file paths

📊 Integrate with monitoring tools like Prometheus, Grafana, or Zabbix

---

### 📦 Summary
```bash
Feature	Method
Manual Execution	./check_vm_health.sh
Scheduled Run	Cron job at 0 9 * * *
Storage	Logs in logs/ folder
Notification	Email sent if VM is down
Source Control	Managed in GitHub repository
```
🔐 Note: Ensure the mail package and SMTP configuration (e.g., via mailutils, sendmail, or Postfix) is set up properly on the system for email alerts to work.

---
