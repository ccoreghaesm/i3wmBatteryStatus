#!/bin/bash

# Simple Bash Script for Check Battry
while 1>0; do
	STATUS=`cat /sys/class/power_supply/BAT0/status`
	VALUE=`cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | sed 's/POWER_SUPPLY_CAPACITY=//'`;
	if [ $VALUE -lt '15' ] && [ $STATUS == "Discharging" ] ; then
		if [ $1 == "--i3" ] ; then
			i3-nagbar -m '🙄🙄🙄🙄 shhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhaaaaarrrrrg⚡'& > /dev/null

		else 
			notify-send --urgency=critical "🙄🙄🙄🙄Hoy Khar ..." "⚡⚡⚡\n⚡⚡\n⚡\nChargeeeeeeeeee Naaaaaaaaaaaaaaaddddddddddaaaaaaaaaaarrrrraaaaaaaaaammmmmmmmmm\nBishoor.\n⚡\n⚡⚡\n⚡⚡⚡";
		fi
	fi
	sleep 5;
done
