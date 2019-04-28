#!/usr/bin/env bash

declare -a modes=( lcd mirrored extended lcd-only hdmi-only )

function get_index {
	value="$@"
	for i in "${!modes[@]}"; do
	   if [[ "${modes[$i]}" = "${value}" ]]; then
	       current_index=${i}
	  fi
	done
}

function switch_setup {
	case "$@" in
		"mirrored" )
			xrandr --output HDMI-1 --same-as eDP-1
			echo "mirrored" > /tmp/monitor_setup
		;;

		"extended" )
			 xrandr --output HDMI-1 --primary --right-of eDP-1
			echo "extended" > /tmp/monitor_setup
		;;

		"lcd-only" )
			xrandr --auto && xrandr --output HDMI-1 --off --output eDP-1 --primary
			echo "lcd-only" > /tmp/monitor_setup
		;;

		"hdmi-only" )
			xrandr --auto && xrandr --output eDP-1 --off --output HDMI-1 --primary
			echo "hdmi-auto" > /tmp/monitor_setup
		;;
		
		"lcd" )
			xrandr --auto && xrandr --output eDP-1 --primary
			echo "lcd" > /tmp/monitor_setup
		;;
	esac
}

if [ -e /tmp/monitor_setup ]; then
	MONITOR_SETUP=$(cat /tmp/monitor_setup)
fi

if xrandr|grep -q "HDMI-1 connected"; then
	get_index $MONITOR_SETUP
	index=$(( current_index + 1 ))
	switch_setup ${modes[$index]}
	echo ${modes[$index]} > /tmp/monitor_setup
else
	echo ``"lcd" > /tmp/monitor_setup
fi
