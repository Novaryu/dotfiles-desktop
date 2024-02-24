#!/bin/bash

# Define the sinks you want to switch between
sink1="alsa_output.usb-Universal_Audio_Volt_2_22022037046357-00.HiFi__hw_V2__sink"
sink2="alsa_output.pci-0000_02_00.1.hdmi-stereo-extra1"

# Get the current default sink
current_sink=$(pactl info | grep "Default Sink" | awk '{print $3}')

# Determine the sink to switch to
next_sink=""
if [ "$current_sink" == "$sink1" ]; then
  next_sink="$sink2"
elif [ "$current_sink" == "$sink2" ]; then
  next_sink="$sink1"
else
  echo "Current sink not recognized."
  exit 1
fi

# Switch to the next sink
pactl set-default-sink "$next_sink"

echo "Audio output switched to sink $next_sink"
exec notify-send --expire-time 2000 "Audio Output:" "$next_sink"
