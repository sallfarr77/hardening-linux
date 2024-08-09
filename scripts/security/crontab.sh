#!/bin/bash

# Configure cronjob to run the ClamAV scan script daily at 3 AM Jakarta time
(crontab -l ; echo "0 3 * * * /etc/cron.daily/daily-clamav-scan") | crontab -

echo "Crontab configured for daily ClamAV scan at 3 AM Jakarta time."