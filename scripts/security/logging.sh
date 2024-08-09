#!/bin/bash
# scripts/security/logging.sh

# Install auditd if not installed
apt-get install -y auditd audispd-plugins

# Enable and start the auditd service
systemctl enable auditd
systemctl start auditd

# Configure audit rules
cat <<EOT >> /etc/audit/audit.rules

# Log modifications to passwd/group files
-a always,exit -F arch=b64 -S all -F path=/etc/passwd -F perm=wa -k identity
-a always,exit -F arch=b64 -S all -F path=/etc/shadow -F perm=wa -k identity
-a always,exit -F arch=b64 -S all -F path=/etc/group -F perm=wa -k identity
-a always,exit -F arch=b64 -S all -F path=/etc/gshadow -F perm=wa -k identity
-w /etc/sudoers -p wa -k scope
-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /var/log/lastlog -p wa -k logins
-w /var/run/utmp -p wa -k session
-w /var/log/btmp -p wa -k session
EOT

# Restart auditd
systemctl restart auditd

echo "Logging and auditing configured."