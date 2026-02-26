# DevOps Shell Automation Scripts (In the course of my journey, i will be adding more useful scripys to this repository)

A collection of practical, production-style Bash scripts designed to automate common DevOps tasks such as backups and application deployments.

These scripts demonstrate real-world automation principles including:

- Logging
- Error handling
- Exit code validation
- Retention policies
- Service health checks
- Idempotent operations

---

## 📁 Project Structure
devops-shell-scripts/
│
├── backup.sh
├── deploy.sh
└── README.md


---

# 1️⃣ Automated Backup Script

## 📌 Overview

`backup.sh` creates timestamped compressed backups of an application directory and automatically removes backups older than a defined retention period.

This prevents:

- Data loss
- Disk space exhaustion
- Manual backup errors

---

## 🔧 Features

- Creates `.tar.gz` compressed backups
- Adds timestamps to prevent file conflicts
- Logs all backup activity
- Automatically deletes old backups
- Validates command success using exit codes

---

## ⚙️ Configuration

Edit the following variables inside the script:

```bash
SOURCE_DIR="/var/www/myapp"
BACKUP_DIR="/var/backups/myapp"
RETENTION_DAYS=7

Usage

Make executable:

chmod +x backup.sh

Run manually:

./backup.sh
⏰ Run Automatically with Cron

Example: Run daily at 2 AM

crontab -e

Add:

0 2 * * * /path/to/backup.sh


2️⃣ Deployment Automation Script
📌 Overview

deploy.sh simulates a real-world CI/CD deployment workflow.

It:

Pulls the latest code from Git

Installs production dependencies

Restarts the application service

Verifies the service status

Logs all deployment activity

🔧 Features

Git branch validation

Exit-code error handling

Dependency installation

systemd service restart

Basic health check verification

⚙️ Configuration

Edit inside the script:

APP_DIR="/var/www/myapp"
BRANCH="main"
SERVICE_NAME="myapp"


▶️ Usage

Make executable:

chmod +x deploy.sh

Run:

./deploy.sh
📋 Prerequisites

Linux environment

Bash

Git installed

Node.js (for npm-based apps)

systemd-managed service

Appropriate user permissions


This repository demonstrates practical DevOps automation skills relevant to:

Cloud Engineers

DevOps Engineers

SRE Roles

Platform Engineers

It reflects production-thinking rather than academic scripting.


👤 Author

Yomi Olowu
DevOps Engineer | Cloud & Automation Enthusiast
