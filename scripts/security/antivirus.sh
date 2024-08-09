#!/bin/bash

systemctl stop clamav-freshclam

# Update the ClamAV database
rm -f /var/log/clamav/freshclam.log
freshclam

apt-get install -y clamav clamav-daemon

# Create a scan script
cat <<EOT > /etc/cron.daily/daily-clamav-scan
#!/bin/bash

# Log file location
LOG_FILE="/var/log/clamav/daily-scan.log"

# Create log file if not exist
touch \$LOG_FILE

# Scan the / directory excluding /proc, /sys, /dev, /run, /mnt, /media, /lost+found, and /tmp
clamscan -r --exclude-dir="^/(proc|sys|dev|run|mnt|media|lost+found|tmp)" / > \$LOG_FILE 2>&1
EOT

chmod +x /etc/cron.daily/daily-clamav-scan

systemctl enable clamav-freshclam
systemctl start clamav-freshclam

echo "ClamAV installed and daily scan configured."