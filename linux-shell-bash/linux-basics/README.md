# 🐧 Linux Basics for DevOps & Scripting

Welcome to the **Linux Basics** section of the `linux-shell-bash` repository. This section is designed for beginners who are just getting started with Linux CLI (Command Line Interface), a critical foundation for scripting, automation, and DevOps tasks.


---

## 🐧 What is Linux?

**Linux** is a free, open-source, UNIX-like operating system kernel that serves as the foundation for a wide variety of operating systems known as **Linux distributions** (like Ubuntu, CentOS, Debian, and Red Hat).

It is widely used in servers, cloud platforms (like AWS, Azure, GCP), embedded systems, mobile devices (like Android), supercomputers, and developer environments due to its stability, flexibility, and performance.

### 🔑 Key Characteristics:

- **Open Source**: Freely available to use, modify, and distribute.
- **Multiuser**: Multiple users can use the system simultaneously without interfering with each other.
- **Multitasking**: Can run multiple programs/processes at the same time.
- **Secure**: Strong user permission and security features.
- **Command-line Oriented**: Emphasizes terminal-based interaction, ideal for scripting and automation.
- **Highly Customizable**: Users can tailor Linux to fit almost any use case.

> 💡 Linux is the backbone of modern IT infrastructure and is essential knowledge for DevOps, Cloud, Cybersecurity, and System Administration.

---

## 🏗️ 2. Linux Architecture Overview

- **Kernel** – Core part that interacts with hardware  
- **Shell** – Interface between user and kernel (e.g., bash, zsh)  
- **File System** – Hierarchical structure (`/`, `/home`, `/etc`, etc.)


---

## 📁 3. Linux Filesystem Hierarchy

| Directory | Purpose                              |
|----------|---------------------------------------|
| `/`      | Root directory (top of the hierarchy) |
| `/home`  | User home directories                 |
| `/etc`   | Configuration files                   |
| `/var`   | Logs and variable data                |
| `/bin`   | Essential user commands               |
| `/usr`   | User-installed applications           |
| `/tmp`   | Temporary files                       |

---

## 📘 What You'll Learn

- Understanding the Linux Filesystem
- Common Shell Commands (`cd`, `ls`, `pwd`, `cp`, `mv`, `rm`, etc.)
- File Permissions & Ownership
- File and Directory Management
- Process Management
- Users, Groups, and Permissions
- Basic Networking Commands
- Package Management using `apt`
- Navigating and editing files with `nano` and `vim`
- System info, users, and logs

---
## 🧱 Key Topics Covered

| Topic Number | Topic Name                    | Details / Commands Covered                                                                                         |
|--------------|------------------------------|-------------------------------------------------------------------------------------------------------------------|
| 1. 📁        | Linux File System Structure  | `/home`, `/etc`, `/var`, `/usr`, `/bin`, `/opt`, etc.<br>Absolute vs. Relative paths<br>Understanding mount points |
| 2. 📂        | File & Directory Operations  | `ls`, `cd`, `pwd`, `mkdir`, `rmdir`, `rm`, `touch`, `cp`, `mv` <br>Wildcards (`*`, `?`) and file globbing<br>Hidden files and extensions |
| 3. ✏️        | File Viewing & Editing       | `cat`, `more`, `less`, `head`, `tail`, `nano`, `vim` <br>Searching text: `grep`, `find`                            |
| 4. 👥        | User & Group Management      | Creating users: `useradd`, `passwd`, `usermod` <br>Groups: `groupadd`, `gpasswd`, `usermod -aG` <br>Switching users: `su`, `sudo` |
| 5. 🔐        | File Permissions & Ownership | `chmod`, `chown`, `chgrp` <br>Understanding `rwx` bits <br>Octal vs. symbolic modes (e.g., `chmod 755`, `chmod u+x`) |
| 6. 📦        | Package Management           | Debian-based: `apt`, `dpkg` <br>Red Hat-based: `yum`, `dnf`, `rpm`                                                |
| 7. 🌐        | Networking Commands          | `ping`, `ifconfig`, `ip`, `netstat`, `ss`, `curl`, `wget` <br>Viewing ports and active connections                |
| 8. 🧮        | Process & System Monitoring  | `top`, `htop`, `ps`, `kill`, `nice`, `uptime` <br>`df`, `du`, `free`, `who`, `uptime`                              |
| 9. 🧹        | Disk & File Management       | Checking disk usage: `df`, `du` <br>Mounting and unmounting drives <br>Disk partitioning basics: `lsblk`, `fdisk`, `blkid` |
| 10. 📜       | Useful Shortcuts & Tricks    | Using aliases (`alias ll='ls -alF'`) <br>Command chaining (`&&`, `||`, `;`) <br>Job control: `&`, `jobs`, `fg`, `bg` |

---

### 📁 1. Linux File System Structure

Formatted in **Markdown** and presented in a clean **table layout**.

---

### 📁 Linux File System Structure

| Directory              | Full Path        | Purpose / Description                                                                      |
| ---------------------- | ---------------- | ------------------------------------------------------------------------------------------ |
| **Root**               | `/`              | Top-level directory of the entire Linux file system. All files and directories start here. |
| **Home**               | `/home`          | Contains personal directories for all users. e.g., `/home/username`.                       |
| **Root User**          | `/root`          | Home directory for the root (superuser). Not to be confused with `/`.                      |
| **Binaries**           | `/bin`           | Essential user binaries (commands), like `ls`, `cp`, `mv`, etc.                            |
| **System Binaries**    | `/sbin`          | System binaries (mainly for root/admin), e.g., `iptables`, `reboot`, etc.                  |
| **Configuration**      | `/etc`           | Contains system-wide configuration files and directories.                                  |
| **Device Files**       | `/dev`           | Contains special device files like hard drives, USBs (`/dev/sda`, `/dev/tty`, etc.).       |
| **Boot**               | `/boot`          | Contains files needed for booting the system like kernels, initrd, GRUB.                   |
| **Temporary Files**    | `/tmp`           | Temporary files created by system and users. Emptied on reboot.                            |
| **Var**                | `/var`           | Variable files such as logs, mail, spool files (`/var/log`, `/var/mail`).                  |
| **User Programs**      | `/usr`           | Secondary hierarchy for user-installed software.                                           |
| **Local Programs**     | `/usr/local`     | Locally installed programs and scripts.                                                    |
| **Library Files**      | `/lib`, `/lib64` | Shared libraries for binaries in `/bin` and `/sbin`.                                       |
| **Media Mounts**       | `/media`         | Auto-mounted removable media (CDs, USBs, etc.).                                            |
| **Manual Mount Point** | `/mnt`           | Temporary mount point for mounting filesystems manually.                                   |
| **Optional Packages**  | `/opt`           | Optional third-party software packages.                                                    |
| **Proc**               | `/proc`          | Virtual filesystem containing system and process information.                              |
| **Sys**                | `/sys`           | Virtual filesystem for exposing information about hardware and kernel.                     |
| **Run**                | `/run`           | Stores runtime data (PID files, sockets).                                                  |
| **Swap Space**         | [not a folder]   | Swap space used as virtual memory, not a directory.                                        |

---

### 🧠 Key Concepts

| Concept           | Description                                                          |
| ----------------- | -------------------------------------------------------------------- |
| **Absolute Path** | Path that starts from the root `/`, e.g., `/home/user/docs`          |
| **Relative Path** | Path relative to current directory, e.g., `../folder/`               |
| **Mount Point**   | A directory where an external device or partition is made accessible |

---

## 🧪 How to Use This Folder

- **Start at the top:** Read through each section in order.  
- **Practice hands-on:** Run each command in your own terminal.  
- **Refer screenshots:** Use the `images/` folder for visual guidance.  
- **Test yourself:** Try commands without copy-pasting to build muscle memory.
---
### 📂 2. File & Directory Operations

Formatted in **Markdown** and presented in a clean **table layout**.

---

### 📂 Common Commands for File & Directory Operations

| Operation / Name          | Command(s)          | Purpose / Description                                                                 |
|--------------------------|---------------------|----------------------------------------------------------------------------------------|
| Present / Current Directory | `pwd`               | Prints the **current working directory** path.                                        |
| List Files & Directories  | `ls`                | Lists files and directories in the current directory. Variants: `ls -l`, `ls -a`       |
| Change Directory         | `cd`                | Changes the **current directory**. Example: `cd /home/user/Downloads`                  |
| Create Directory         | `mkdir`             | Creates a **new directory**. Example: `mkdir new_folder`                              |
| Remove Empty Directory   | `rmdir`             | Removes an **empty directory**.                                                       |
| Remove Files/Directories | `rm`                | Deletes **files or directories**. Use `rm -r` for directories.                        |
| Create / Update File     | `touch`             | Creates an **empty file** or updates the timestamp of an existing file.               |
| Copy Files/Directories   | `cp`                | Copies files or directories. Example: `cp file.txt /backup/`                          |
| Move / Rename Files      | `mv`                | Moves or renames files/directories. Example: `mv file.txt archive.txt`                |

---

### 🔀 Advanced File Patterns & Operations

| Operation / Name          | Command(s) / Pattern | Description / Example                                                               |
|--------------------------|---------------------|------------------------------------------------------------------------------------|
| Wildcard (Multiple chars) | `*`                 | Matches **zero or more characters**. Example: `ls *.txt` shows all `.txt` files.   |
| Wildcard (Single char)    | `?`                 | Matches **a single character**. Example: `ls file?.txt` matches `file1.txt`, etc. |
| Hidden Files             | —                   | Files starting with `.` are hidden. Use `ls -a` to view them.                      |
| File Extensions          | —                   | Linux does **not require extensions**, but they help identify file types.          |
| File Type Detection      | `file`              | Displays the **file type** (text, binary, script, etc.). Example: `file script.sh` |

---

### 🧠 Key Concepts

| Concept               | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Current Directory** | The folder you're currently in. Use `pwd` to find out.                       |
| **Relative Path**     | Path starting from current location. Example: `../folder/file.txt`           |
| **Absolute Path**     | Full path from root `/`. Example: `/home/user/file.txt`                      |
| **Wildcard**          | Symbols like `*` and `?` that help match multiple files                      |
| **Recursive Delete**  | `rm -r foldername` deletes folders and their contents — **use with caution** |

---

### ⚠️ Caution

- `rm -rf /` is a **destructive command** that wipes out your entire system. Never run it.
- Always double-check file names when using wildcards with `rm`.

---

You can now practice creating folders, copying files, renaming them, and navigating around your Linux system. Let me know if you'd like screenshots, quiz questions, or practice tasks added!

---

### ✏️ 3. File Viewing & Editing

Formatted in **Markdown** and presented in a clean table layout.

---

### ✏️ File Viewing & Editing Commands

| Operation / Name           | Command(s)            | Purpose / Description                                                                                         |
|---------------------------|-----------------------|--------------------------------------------------------------------------------------------------------------|
| Display Entire File Content | `cat filename`         | Displays the entire content of the file on the terminal.                                                     |
| View File Page-by-Page     | `more filename`        | Views the file one screen at a time, scroll down with space or enter.                                        |
| Scrollable File Viewer     | `less filename`        | Improved paging viewer that allows backward and forward movement in the file. Use `q` to quit.                |
| View First Lines           | `head filename`        | Displays the first 10 lines by default. Use `head -n 20 filename` for first 20 lines.                         |
| View Last Lines            | `tail filename`        | Displays the last 10 lines by default. Useful for monitoring logs. Use `tail -f filename` for live view.      |
| Basic Text Editor          | `nano filename`        | Simple terminal-based text editor; easy for beginners.                                                        |
| Advanced Text Editor       | `vim filename`         | Powerful text editor with modes. Requires learning commands; widely used by Linux pros.                       |
| Search Text in File        | `grep 'pattern' filename` | Searches for lines containing 'pattern' in the file and prints them.                                         |
| Find Files by Name         | `find . -name 'filename'` | Searches recursively from current directory for files named 'filename'.                                      |

---

### 🧠 Key Concepts

| Concept                  | Description                                                                                          |
|--------------------------|----------------------------------------------------------------------------------------------------|
| `cat`                    | Concatenate and display file content quickly.                                                      |
| more vs less             | `more` allows forward paging only; `less` allows both forward and backward navigation.             |
| head & tail              | Useful to see start or end of large files without loading the whole file.                           |
| nano vs vim              | `nano` is beginner-friendly, `vim` is powerful but has a steeper learning curve.                   |
| `grep`                   | Powerful text search utility, supports regular expressions for complex pattern matching.           |
| `tail -f`                | Useful for real-time log monitoring by continuously showing appended data at the file end.         |
| Text Editors Modes       | `vim` has Normal, Insert, Command modes to perform different editing actions.                       |

---

### ⚠️ Tips for Beginners

- To exit `nano`, press **Ctrl + X**.  
- To exit `vim`, press **Esc**, then type `:q` and hit Enter.  
- Use `grep -i` for case-insensitive search.  
- Combine commands, e.g., `grep 'error' /var/log/syslog | less` to search and scroll.

---

### 👥 4. User & Group Management

Formatted in **Markdown** and presented in a clean table layout.

---

### 👥 User & Group Management Commands

| Operation / Name           | Command(s)                      | Purpose / Description                                                                                   |
|---------------------------|--------------------------------|--------------------------------------------------------------------------------------------------------|
| Create a New User         | `useradd username`              | Adds a new user to the system.                                                                          |
| Set/Change User Password  | `passwd username`               | Sets or changes the password for a user.                                                                |
| Modify User Account       | `usermod [options] username`   | Modify user account details like home directory, shell, groups, etc.                                    |
| Delete User               | `userdel username`              | Deletes a user account from the system.                                                                 |
| Add a New Group           | `groupadd groupname`            | Creates a new user group.                                                                                |
| Delete a Group            | `groupdel groupname`            | Deletes a user group.                                                                                    |
| Change Group Password     | `gpasswd groupname`             | Sets or changes the group password (rarely used).                                                       |
| Add User to a Group       | `usermod -aG groupname username` | Adds an existing user to an existing group (append mode).                                              |
| View Current User         | `whoami`                       | Displays the currently logged-in user.                                                                  |
| Switch User               | `su username`                   | Switch to another user account (requires password).                                                    |
| Execute Command as Root   | `sudo command`                  | Execute commands with root privileges (configured via `/etc/sudoers`).                                  |
| List Users                | `cut -d: -f1 /etc/passwd`       | Lists all users on the system.                                                                           |
| List Groups               | `cut -d: -f1 /etc/group`        | Lists all groups on the system.                                                                          |
| View Groups of a User     | `groups username`               | Displays groups the user belongs to.                                                                     |

---

### 🧠 Key Concepts

| Concept                 | Description                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------|
| User Account            | Represents an individual user on the system with a unique username and UID.                              |
| Group                   | A collection of users to simplify permission management.                                                |
| UID (User ID)           | Unique numeric identifier for each user.                                                               |
| GID (Group ID)          | Unique numeric identifier for each group.                                                              |
| Home Directory          | Default directory assigned to a user for personal files, usually `/home/username`.                      |
| sudo                    | Allows permitted users to execute commands as root or another user without switching accounts.         |
| su                      | Switch user command; allows changing user context temporarily.                                          |
| Usermod `-aG` flag      | Appends a user to a group without removing existing group memberships.                                  |

---

### ⚠️ Tips for Beginners

- Use `sudo` instead of logging in as root for safer system administration.  
- Always use the `-a` (append) flag with `usermod -G` to avoid removing a user from other groups.  
- Check group membership with `groups username` after adding users to groups.  
- Use `/etc/passwd` and `/etc/group` files to view user and group details manually.

---
### 🔐 5. File Permissions & Ownership

Formatted in **Markdown** and presented in a clean table layout.

---

### 🔐 File Permissions & Ownership Commands

| Operation / Name          | Command(s)                     | Purpose / Description                                                                                         |
|--------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------|
| View Permissions         | `ls -l filename`               | Lists detailed file info including permissions, owner, and group.                                            |
| Change Permissions       | `chmod [options] mode file`   | Changes file or directory permissions (e.g., `chmod 755 file`, `chmod u+x file`).                             |
| Change Owner             | `chown owner[:group] file`    | Changes the owner and optionally the group of a file or directory.                                           |
| Change Group             | `chgrp group file`             | Changes the group ownership of a file or directory.                                                          |
| View Numeric (Octal) Permissions | `stat filename`          | Shows detailed file info including numeric permission representation.                                        |
| Set Default Permissions  | `umask [mode]`                 | Sets the default permission mask for newly created files and directories.                                    |
| Recursive Permission Change | `chmod -R mode directory`   | Changes permissions recursively for all files and directories inside the specified directory.                 |
| Recursive Ownership Change  | `chown -R owner:group directory` | Changes ownership recursively for directory and its contents.                                               |
| Set Sticky Bit           | `chmod +t directory`           | Prevents users from deleting files they don't own in a shared directory (e.g., `/tmp`).                       |
| Set Setuid Bit           | `chmod u+s file`               | Executes the file with the permissions of the file owner (usually root).                                     |
| Set Setgid Bit           | `chmod g+s directory`          | New files in the directory inherit the group ownership of the directory.                                     |

---

### 🧠 Key Concepts

| Concept                  | Description                                                                                                 |
|--------------------------|-------------------------------------------------------------------------------------------------------------|
| Permission Types         | Read (r = 4), Write (w = 2), Execute (x = 1) permissions for User, Group, Others.                           |
| Symbolic Notation        | `rwxr-xr--` format: User (owner), Group, Others permissions.                                               |
| Numeric (Octal) Notation | Permissions represented as three digits, e.g., 755 = rwxr-xr-x (4+2+1, 4+0+1, 4+0+0).                       |
| Owner & Group            | Each file/directory has an owner user and an associated group.                                             |
| umask                    | Determines default permission bits removed when creating new files/directories.                            |
| Sticky Bit               | Mainly used on shared directories to restrict file deletion.                                              |
| Setuid and Setgid Bits   | Special permission bits that allow executing files with the permissions of the file owner/group.           |

---

### ⚠️ Tips for Beginners

- Use `ls -l` to check file permissions before making changes.  
- Be careful when using `chmod 777` as it grants full permissions to everyone.  
- Use symbolic notation (e.g., `chmod u+x`) for easier permission changes.  
- Use `sudo` if permission changes fail due to lack of rights.  
- Understand the security implications of Setuid and Setgid bits before using them.  

---

Let me know if you'd like example commands, visual permission charts, or practice exercises for this topic!



## 🛠️ Recommended Setup

- Ubuntu Linux (Preferred) or any Linux distro (via VirtualBox, Dual Boot, or Cloud VM)  
- Windows Subsystem for Linux (WSL) if on Windows  
- Terminal emulator: GNOME Terminal, Windows Terminal, etc.  
- Text Editor: Nano, Vim, or VSCode

---

## 🚀 Practical Use Cases

- Navigating AWS EC2 Linux instances
- Automating tasks in Jenkins agents
- Troubleshooting Linux-based containers
- Managing permissions in shared environments
- Writing scripts that interact with files, logs, and services

---
## 🔗 References

- [The Linux Command Line Book (by William Shotts)](https://linuxcommand.org/tlcl.php)  
- [Linux Journey](https://linuxjourney.com)  
- [Ubuntu Official Documentation](https://help.ubuntu.com)  
- [Abhishek Veeramalla Linux Playlist](https://www.youtube.com/playlist?list=PLdpzxOOAlwvIBIRWcReRV-m2kgIW6V6gr)  
- [PythonLife Telugu Linux Basics](https://youtu.be/YsFfo9IF4W4?si=__4D5ljRIdUeaN-5)  

---

## 📂 Folder Structure

```bash
linux-basics/
├── README.md                 # You're here!
└── images/                   # Screenshots & diagrams
```
---
touch file.txt           # Create file
mkdir mydir              # Create directory
rm file.txt              # Delete file
rm -r mydir              # Delete directory recursively
cp file1 file2           # Copy file
mv oldname newname       # Rename or move
cat file.txt             # View file contents

---

