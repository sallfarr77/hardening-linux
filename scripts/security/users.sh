#!/bin/bash
# scripts/security/users.sh

# Ensure password expiration for all accounts
awk -F: '{ print $1 }' /etc/passwd | while read -r user 
do 
    chage --maxdays 90 "$user"
    chage --mindays 7 "$user"
    chage --warndays 7 "$user"
done

echo "User accounts configured for password policies."