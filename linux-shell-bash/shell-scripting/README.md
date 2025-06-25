## 📂 Topics

### 1. 🐚 Shell-Scripting

Shell scripting is writing a series of commands for the shell to execute automatically. Shell scripts are often used for:

- Automating system administration tasks
- Running backups and scheduled jobs (cron)
- Managing files, users, and processes
- Simplifying repetitive command-line tasks

Example of a simple shell script:

```bash
#!/bin/bash
echo "Hello, World!"
```
### 2. 🤖 Automation Definition

Automation refers to using technology to perform tasks with minimal human intervention.

In **IT and DevOps**, automation helps in:

- Reducing manual errors  
- Speeding up repetitive tasks (like testing, deployment)  
- Ensuring consistency across environments  
- Improving productivity and scalability  

#### 🔧 Common tools used in automation:

- **Shell scripts**  
- **CI/CD tools** like Jenkins, GitHub Actions  
- **Configuration management**: Ansible, Puppet, Chef  
- **Infrastructure as Code (IaC)**: Terraform, AWS CloudFormation 
---

### 🤖 Automation Example Scenario: Daily Backup of Project Files

#### 🧠 The Problem (Manual Way)

You’re working on a coding project on your computer.  
Every evening, you manually:

1. Open the terminal  
2. Copy your project folder to a backup folder  
3. Rename it with today’s date  

It’s easy to forget or make a mistake — and it wastes time every day!

---

#### ✅ The Solution (Automated Way)

You write a **Shell script** that does this backup for you.  
Then you schedule it to **run automatically every evening** using a tool called `cron`.

---

#### 🛠️ Shell Script: `backup.sh`

```bash
#!/bin/bash             ## 1. Shebang line: tells the system to use Bash shell to run the script

# Folder to backup
SOURCE="/home/user/my-project"

# Where to save backup
DEST="/home/user/backup"

# Get today's date
DATE=$(date +%Y-%m-%d)

# Run the backup
cp -r $SOURCE "$DEST/project-backup-$DATE"

echo "Backup created for $DATE"
 ```
---

## 🕒 Automation with Cron Job (Daily at 7 PM)

To automate this script:

1. Open terminal  
2. Type `crontab -e`  
3. Add this line:

```bash
0 19 * * * /home/user/backup.sh
```
### 🎯 Result

- Backup runs daily at 7 PM  
- No forgetting, no mistakes  
- Fully automated, no effort

---

### 🧠 Summary

- ✅ Saves time  
- ✅ Keeps data backed up  
- ✅ Eliminates human errors  
- ✅ Simple tools (Shell + Cron) do the job

---


# 🐚 How to Write a Shell Script: Complete Guide

---

## 1. Naming the Script File

- Use a meaningful, descriptive name related to the script’s purpose.  
- Use lowercase letters and hyphens or underscores to separate words.  
- End with `.sh` extension to indicate it’s a shell script (optional but recommended).  

**Examples:**  
`backup.sh`  
`disk-usage-monitor.sh`  
`cleanup_temp.sh`

---

## 2. Structure of a Shell Script File

Every shell script usually follows this basic structure:

```bash
#!/bin/bash              # 1. Shebang line: tells the system to use Bash shell to run the script

# 2. Comments: explain what the script does and important details
# This script backs up the Documents folder daily

# 3. Variable declarations (optional)
SOURCE_DIR="$HOME/Documents"
BACKUP_DIR="$HOME/backups"

# 4. Commands and logic
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$(date +'%Y%m%d').tar.gz" -C "$SOURCE_DIR" .

# 5. Output messages (optional)
echo "Backup completed successfully."
```
---
# Different Types of Shell Scripting

Shell scripting can be done using different shell interpreters (shells). Each shell has its own features and syntax variations. Here are some common types:

---
## Summary Table

| Shell | Description                    | Popularity          | File Extension |
|-------|--------------------------------|---------------------|----------------|
| bash  | Most common, feature-rich      | Very high           | `.sh`, `.bash` |
| sh    | Original Bourne shell          | High (portable)     | `.sh`          |
| csh   | C-like syntax                 | Low (legacy)        | `.csh`         |
| ksh   | Mix of sh and csh features     | Moderate (enterprise)| `.ksh`         |
| zsh   | Advanced, user-friendly shell | Increasingly popular| `.zsh`         |

---

**Note:**  
When writing shell scripts, use the appropriate shebang line to specify the shell interpreter, for example:

```bash
#!/bin/bash     # For bash scripts
#!/bin/sh       # For sh scripts
#!/bin/zsh      # For zsh scripts
```
