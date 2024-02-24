#!/bin/bash

# Refresh display
pkill picom
xrandr --output DP-1 --primary --output HDMI-0 --right-of DP-1
sleep 1
picom &
