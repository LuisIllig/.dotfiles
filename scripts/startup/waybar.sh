#!/bin/sh

if pgrep -x waybar > /dev/null; then
    pkill -x waybar
fi
if pgrep -x .waybar-wrapped > /dev/null; then
    pkill -x .waybar-wrapped
fi

waybar &