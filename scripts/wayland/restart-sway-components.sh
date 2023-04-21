#!/bin/sh

##########
# waybar #
##########
if pgrep -x .waybar-wrapped > /dev/null; then
    pkill -x .waybar-wrapped
fi
waybar &

################
# notification #
################
if pgrep -x .mako-wrapped > /dev/null; then
    pkill -x .mako-wrapped
fi
mako &

##############
# autotiling #
##############
if pgrep -x .autotiling-wra > /dev/null; then
    pkill -x .autotiling-wra
fi
autotiling &

###############
# wlan applet #
###############
if pgrep -x .nm-applet-wrapped > /dev/null; then
    pkill -x .nm-applet-wrapped
fi
nm-applet --indicator &

if pgrep -x cava > /dev/null; then
    pkill -x cava
fi