#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown
polybar bar3 2>&1 | tee -a /tmp/polybar3.log & disown
polybar bar4 2>&1 | tee -a /tmp/polybar4.log & disown
polybar bar5 2>&1 | tee -a /tmp/polybar5.log & disown
polybar systray 2>&1 | tee -a /tmp/systray.log & disown
echo "Bars launched..."
