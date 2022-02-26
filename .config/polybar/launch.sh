#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

## Primary monitor use bar1
#polybar -c $HOME/.config/polybar/config.ini --reload bar1 &
#
## Other monitors use bar2
#for m in $(polybar --list-monitors | grep -v 'primary' | cut -d":" -f1); do
#    MONITOR=$m polybar -c $HOME/.config/polybar/config.ini --reload bar2 &
#done


# All monitor ues bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -c $HOME/.config/polybar/config.ini --reload bar &
done
