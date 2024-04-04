#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Trying without sudo, not possible!  "
    exit 1
fi
ipfile="/etc/network/bridge-static-ip"

if [ -f "$ipfile" ]; then
    rm "$ipfile"
fi
echo "#Static IP Configuration " >> $ipfile
echo "#Replace interface_name with actual one  & replace IP/Network/Gateway/DNS server address !!!!"  >>  $ipfile
echo "auto lo" >> $ipfile
echo "iface lo inet loopback" >> $ipfile
echo "auto interface_name"  >> $ipfile
echo "iface interface_name  inet static" >> $ipfile
echo "address 10.10.10.10/24" >> $ipfile
echo "gateway 10.10.10.1" >> $ipfile
echo "dns-nameservers 10.10.10.1" >> $ipfile
echo "bridge-ports interface_name" >> $ipfile
echo "bridge-stp off" >> $ipfile
echo "bridge-fd 0" >> $ipfile
echo "#### End of Bridge Configuration  #### " >> $ipfile

 
