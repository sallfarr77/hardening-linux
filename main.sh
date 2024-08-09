#!/bin/bash
# main.sh

# Run system updates and upgrades
bash ./api-server-hardening/scripts/system/updates.sh

# Configure the firewall
bash ./api-server-hardening/scripts/security/firewall.sh

# Harden SSH configuration
bash ./api-server-hardening/scripts/security/ssh.sh

# Set user password policies
bash ./api-server-hardening/scripts/security/users.sh

# Set file permissions
bash ./api-server-hardening/scripts/system/file-permissions.sh

# Install and configure Fail2Ban
bash ../api-server-hardening/scripts/security/fail2ban.sh

# Configure logging and auditing
bash ../api-server-hardening/scripts/security/logging.sh

# Install and configure unattended upgrades
bash ./api-server-hardening/scripts/system/unattended-upgrades.sh

# Set timezone to Jakarta
bash ./api-server-hardening/scripts/system/timezone.sh

# Install and configure antivirus
bash ./api-server-hardening/scripts/security/antivirus.sh

# Configure crontab for ClamAV daily scan
bash ./api-server-hardening/scripts/security/crontab.sh

# Disk encryption (additional steps required)
bash ./api-server-hardening/scripts/security/disk-encryption.sh

echo "System hardening complete."