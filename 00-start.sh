#!/bin/bash

logdir="/var/log/mit"

if [ ! -d "$logdir" ]; then
	sudo mkdir "$logdir"
else   echo "Log Directory is Already Exist" 
fi

