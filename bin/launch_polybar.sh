#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload minimal &
  done
else
  polybar --reload minimal &
fi

# sleep 0.2
# polybar-msg cmd hide

echo "Polybar launched..."
