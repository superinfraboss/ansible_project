#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Trying without sudo, not possible!  "
    exit 1
fi
read -p "Enter customer abbrevation :" cust
read -p "Enter the new hostname: " new_hostname

if [ -z "$new_hostname" ]; then
    echo "Hostname cannot be empty. Exiting..."
    exit 1
fi

sudo hostnamectl set-hostname "$new_hostname"

echo "Hostname set to: $new_hostname"

sed -i "s/127.0.1.1.*/127.0.1.1\t$new_hostname.$(hostname -f) $new_hostname/" /etc/hosts

ip_address=$(ip route get 1 | awk '{print $7;exit}')
echo "ip_address"
echo  "$ip_address $new_hostname.$cust.local $new_hostname"  >> /etc/hosts

echo "Updated Host File"
cat /etc/hosts
echo "-------------------------------"
hostname --ip-address
echo "Hostname to IP test successful"
echo "-------------------------------"
echo 'Server Hostname is set  - successful !'| tee -a > /var/log/mit/02hn-install.log-$(date +"%d-%b-%Y-%H%M%S")
