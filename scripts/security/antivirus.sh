#!/bin/bash
# scripts/security/antivirus.sh

# Install ClamAV and ClamAV-Daemon
apt-get install -y clamav clamav-daemon

# Update ClamAV database
freshclam

# Create a scan script
cat <<EOT > /etc/cron.daily/daily-clamav-scan
#!/bin/bash

# Log file location
LOG_FILE="/var/log/clamav/daily-scan.log"

# Create log file if not exist
touch \$LOG_FILE

# Scan the / directory excluding /proc, /sys, /dev, /run, /mnt, /media, /lost+found, and /tmp
clamscan -r --exclude-dir="^/(proc|sys|dev|run|mnt|media|lost+found|tmp)" / > \$LOG_FILE
EOT

# Make the scan script executable
chmod +x /etc/cron.daily/daily-clamav-scan

echo "ClamAV installed and daily scan configured."