#!/bin/bash

apt-get install -y fail2ban

# Create local configuration if not exists
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Configure jails
cat <<EOT >> /etc/fail2ban/jail.local

[sshd]
enabled  = true
port     = 2222
logpath  = /var/log/auth.log
maxretry = 5

[http-get-dos]
enabled = true
port    = http,https
filter  = http-get-dos
logpath = /var/log/nginx/access.log
maxretry = 300
findtime = 300
bantime = 600
action = iptables[name=HTTP, port=http, protocol=tcp]
EOT

systemctl restart fail2ban

echo "Fail2Ban installed and configured."