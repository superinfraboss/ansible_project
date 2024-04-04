#!/bin/bash

# Get the network interface name
interface=$(ip -o link show | awk -F': ' '{print $2}')

echo "Network interface name: $interface"
