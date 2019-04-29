#!/usr/bin/env bash

declare -a modes=( mirrored extended hdmi-only lcd-only )

MONITOR_SETUP="/tmp/monitor_setup"
I3_RESTART="i3 restart"

function get_index {
	value="$@"
	if [[ ${value} = "lcd-only" || ${value} = "" ]] ; then 
		current_index=-1
		return 0
	fi
	#${!modes[@]} return the index; ${modes[@]} will return the element.
	for i in "${!modes[@]}"; do
	   if [[ "${modes[$i]}" = "${value}" ]]; then
	       current_index=${i}
	  fi
	done
}

function switch_setup {
	case "$@" in
		"extended" )
			 xrandr --output HDMI-1 --primary --right-of eDP-1
			echo "extended" > $MONITOR_SETUP
			$($I3_RESTART)
		;;
		"lcd-only" )
			xrandr --auto && xrandr --output HDMI-1 --off --output eDP-1 --primary
			echo "lcd-only" > $MONITOR_SETUP
			$($I3_RESTART)

		;;
		"hdmi-only" )
			xrandr --auto && xrandr --output HDMI-1 --primary --output eDP-1 --off
			echo "hdmi-only" > $MONITOR_SETUP
			$($I3_RESTART)
		;;		
		* | "" )
			xrandr --auto --output eDP-1 --primary
			echo "mirrored" > $MONITOR_SETUP
			$($I3_RESTART)
		;;
	esac
}

if [ -e $MONITOR_SETUP ]; then
	CURRENT_SETUP=$(cat $MONITOR_SETUP)
else
	echo "" > $MONITOR_SETUP
	xrandr --auto --output eDP-1 --primary
	$($I3_RESTART)
fi

if xrandr|grep -q "HDMI-1 connected"; then
	get_index $CURRENT_SETUP
	index=$(( current_index + 1 ))
	switch_setup ${modes[$index]}
	echo ${modes[$index]} > $MONITOR_SETUP
else
	rm $MONITOR_SETUP
	xrandr --auto --output eDP-1 --primary
	$($I3_RESTART)
fi
