# 🐚 Bash Scripting: Guide

---

## What is Bash?
## 🐚 What is Bash?

Bash (Bourne Again SHell) is a command-line interface and scripting language for Unix-like operating systems, including Linux, macOS, and Windows (via WSL or Git Bash). Developed by Brian Fox in 1989 for the GNU Project, it serves as a free and open-source replacement for the original Bourne shell (`sh`) and incorporates features from the Korn shell (`ksh`) and C shell (`csh`). 

Bash (Bourne Again Shell) is the most widely used shell on Linux and macOS systems.  
It extends the original `sh` with many powerful features for scripting and interactive use.

As the default shell on most Linux distributions, Bash allows users to interact with the system through commands and scripts, facilitating tasks such as file manipulation, program execution, and system administration.

---
## 🧰 Key Features

- **Command Interpreter:** Processes and executes user commands entered in the terminal.  
- **Scripting Language:** Enables automation of tasks through shell scripts.  
- **POSIX Compliant:** Ensures compatibility with the POSIX standard for Unix-like systems.  
- **Extensible:** Supports functions, loops, conditionals, and variables for advanced scripting.  
- **Interactive Use:** Provides features like command history and job control for efficient command-line usage.

---

## Why Use Bash Scripting?

- Rich scripting syntax and built-in commands  
- Supports arrays, arithmetic, string manipulation  
- Functions and advanced control flow  
- Job control and process management  
- Widely available and default on most Linux systems  

---

## Basic Bash Script Structure

```bash
#!/bin/bash

# Script description
echo "Hello from Bash!"

# Variables
name="User"
echo "Welcome, $name"

# Conditional
if [ -f "/etc/passwd" ]; then
  echo "File exists."
fi

# Loop
for i in {1..5}; do
  echo "Iteration $i"
done

```
---

### 🔍 Explanation

- `#!/bin/bash` – This line tells the system to use the Bash shell as the interpreter.
- `#` – Anything after `#` is treated as a comment.
- `echo` – A command used to print text to the terminal.
---
## ✅ Basic Structure & Execution of a Bash Script

### 📄 Sample Script

```bash
#!/bin/bash

# This is a comment
echo "Hello, World!"

```
---
## ▶️ How to Run a Bash Script
### Create the script file:

```bash

nano hello.sh
```

Paste the script content and save the file.

### Make the script executable:

```bash

chmod +x hello.sh
```
### Run the script:
```bash

./hello.sh
```

### 🖨️ Expected Output
```bash

Hello, World!
```
