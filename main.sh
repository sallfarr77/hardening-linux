#!/bin/bash
# main.sh

# Run system updates and upgrades
bash ./scripts/system/updates.sh

# Configure the firewall
bash ./scripts/security/firewall.sh

# Harden SSH configuration
bash ./scripts/security/ssh.sh

# Set user password policies
bash ./scripts/security/users.sh

# Set file permissions
bash ./scripts/system/file-permissions.sh

# Install and configure Fail2Ban
bash ../scripts/security/fail2ban.sh

# Configure logging and auditing
bash ../scripts/security/logging.sh

# Install and configure unattended upgrades
bash ./scripts/system/unattended-upgrades.sh

# Set timezone to Jakarta
bash ./scripts/system/timezone.sh

# Install and configure antivirus
bash ./scripts/security/antivirus.sh

# Configure crontab for ClamAV daily scan
bash ./scripts/security/crontab.sh

# Disk encryption (additional steps required)
bash ./scripts/security/disk-encryption.sh

echo "System hardening complete."