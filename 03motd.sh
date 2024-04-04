#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Trying without sudo, not possible!  "
    exit 1
fi
echo "Custom Linux Installation, do not try on your own, else, there is every possibility of breaking the system, you are warned !"  > /etc/motd

echo 'MOTD set successful !'| tee -a > /var/log/mit/03motd-install.log-$(date +"%d-%b-%Y-%H%M%S")

