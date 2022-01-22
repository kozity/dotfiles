#!/usr/bin/sh

killall -q polybar

polybar primary 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched."
