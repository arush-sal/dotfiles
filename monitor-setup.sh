#!/usr/bin/env bash

declare -a modes=( hdmi-only lcd-only mirrored extended )

MONITOR_SETUP="/tmp/monitor_setup"
I3_RESTART="/usr/bin/i3-msg restart"
WALLPAPER_RESET="feh --bg-scale $HOME/Pictures/punisher.png"
DISPLAY_RESET="xrandr --auto --output eDP-1 --primary --dpi 96"

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
			xrandr --output HDMI-1 --primary --left-of eDP-1
			echo "extended" > $MONITOR_SETUP
			$I3_RESTART
			$WALLPAPER_RESET

		;;
		"lcd-only" )
			xrandr --auto && xrandr --output HDMI-1 --off --output eDP-1 --primary
			echo "lcd-only" > $MONITOR_SETUP
			$I3_RESTART
			$WALLPAPER_RESET

		;;
		"hdmi-only" )
			xrandr --auto && xrandr --output HDMI-1 --primary --output eDP-1 --off
			echo "hdmi-only" > $MONITOR_SETUP
			$I3_RESTART
			$WALLPAPER_RESET
		;;		
		* | "" )
			$DISPLAY_RESET
			echo "mirrored" > $MONITOR_SETUP
			$I3_RESTART
			$WALLPAPER_RESET
		;;
	esac
}

if [ -e $MONITOR_SETUP ]; then
	CURRENT_SETUP=$(cat $MONITOR_SETUP)
else
	echo "" > $MONITOR_SETUP
	$DISPLAY_RESET
	$I3_RESTART
	$WALLPAPER_RESET
fi

if xrandr|grep -q "HDMI-1 connected"; then
	get_index $CURRENT_SETUP
	index=$(( current_index + 1 ))
	switch_setup ${modes[$index]}
	echo ${modes[$index]} > $MONITOR_SETUP
else
	rm $MONITOR_SETUP
	$DISPLAY_RESET
	$I3_RESTART
	$WALLPAPER_RESET
fi
