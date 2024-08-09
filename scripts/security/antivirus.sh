#!/bin/bash

apt-get install -y clamav clamav-daemon

freshclam

# Create a scan script
cat <<EOT > /etc/cron.daily/daily-clamav-scan
#!/bin/bash

LOG_FILE="/var/log/clamav/daily-scan.log"
touch \$LOG_FILE

# Scan the / directory excluding /proc, /sys, /dev, /run, /mnt, /media, /lost+found, and /tmp
clamscan -r --exclude-dir="^/(proc|sys|dev|run|mnt|media|lost+found|tmp)" / > \$LOG_FILE
EOT

chmod +x /etc/cron.daily/daily-clamav-scan

echo "ClamAV installed and daily scan configured."