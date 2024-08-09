#!/bin/bash

# Check if root has no crontab and create an empty one if necessary
if ! crontab -l >/dev/null 2>&1; then
    echo "# Empty crontab for root created" | crontab -
fi

# Configure cronjob to run the ClamAV scan script daily at 3 AM Jakarta time
(crontab -l ; echo "0 3 * * * /etc/cron.daily/daily-clamav-scan") | crontab -

echo "Crontab configured for daily ClamAV scan at 3 AM Jakarta time."