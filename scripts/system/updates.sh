#!/bin/bash
# scripts/system/updates.sh

# Update and upgrade the system
apt-get update -y
apt-get upgrade -y

echo "System updated and upgraded."