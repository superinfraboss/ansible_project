#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Trying without sudo, not possible!  "
    exit 1
fi
timedatectl set-timezone Asia/Kolkata
if   timedatectl  | grep -q 'Asia/Kolkata' ; then
	echo 'Set India timezone -systemside - successful !'| tee -a > /var/log/mit/01tz-install.log-$(date +"%d-%b-%Y-%H%M%S")
fi

