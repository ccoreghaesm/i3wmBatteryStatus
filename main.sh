#!/bin/bash

# Simple Bash Script for Check Battry
while 1>0; do
	VALUE=cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | sed 's/POWER_SUPPLY_CAPACITY=//';
	if [ $VALUE -lt '20' ] ; then
		notify-send "Battery" "Bezan BeCharge";
	fi
	sleep 5;
done
