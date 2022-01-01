#!/bin/bash

hdmimonitor=$(xrandr |grep ' connected'| grep -i hdmi | awk '{print $1}')


#echo $2 $3

if [ $2 == "edp1" ]
then
    xrandr --output eDP1 --auto --primary --output $hdmimonitor --off
else
    if [ $3 == "only" ]
    then
	xrandr --output $hdmimonitor  --auto --primary --output eDP1 --off
    else
	position=$3
	if [ $1 == $hdmimonitor ]
	then
	    xrandr --output $hdmimonitor --auto --primary $position eDP1 --output eDP1 --auto
	else
	    xrandr --output $hdmimonitor --auto --noprimary $position eDP1 --output eDP1 --auto
	fi
    fi
fi

