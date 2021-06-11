#!/bin/bash

# Simple Bash Script for Check Battry
while 1>0; do
	STATUS=`cat /sys/class/power_supply/BAT0/status`
	VALUE=`cat /sys/class/power_supply/BAT0/capacity`;
	if [ $VALUE -lt '30' ] && [ $STATUS == "Discharging" ] ; then
		if [ $1 == "--i3" ] ; then
			i3-nagbar -m 'Neet to charge'& > /dev/null

		else 
			notify-send --urgency=critical "Need to charge";
		fi
	fi
	sleep 5;
done
