#!/bin/bash

# Simple Bash Script for Check Battry
while 1>0; do
	STATUS=`cat /sys/class/power_supply/BAT0/status`
	while [ $STATUS == "Charging" ] ; do
		sleep 1m
		STATUS=`cat /sys/class/power_supply/BAT0/status`
	done
	VALUE=cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | sed 's/POWER_SUPPLY_CAPACITY=//';
	if [ $VALUE -lt '20' ] ; then
		notify-send --urgency=critical "🙄🙄🙄🙄\n\n🙄🙄🙄🙄\nHoy Khar ..." "⚡⚡⚡\n⚡⚡\n⚡\nChargeeeeeeeeee Naaaaaaaaaaaaaaaddddddddddaaaaaaaaaaarrrrraaaaaaaaaammmmmmmmmm\nBishoor.\n⚡\n⚡⚡\n⚡⚡⚡";
	fi
	sleep 5;
done
