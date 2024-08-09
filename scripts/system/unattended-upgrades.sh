#!/bin/bash
# scripts/system/unattended-upgrades.sh

# Install unattended-upgrades if not installed
apt-get install -y unattended-upgrades apt-listchanges

# Enable unattended upgrades
dpkg-reconfigure -plow unattended-upgrades

# Configure unattended upgrades
cat <<EOT > /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
EOT

echo "Unattended upgrades installed and configured."