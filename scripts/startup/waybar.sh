#!/bin/sh

if pgrep -x waybar > /dev/null; then
    pkill -x waybar
fi
if pgrep -x .waybar-wrapped > /dev/null; then
    pkill -x .waybar-wrapped
fi

waybar &



if pgrep -x mako > /dev/null; then
    pkill -x mako
fi
if pgrep -x .mako-wrapped > /dev/null; then
    pkill -x .mako-wrapped
fi

mako &



if pgrep -x autotiling > /dev/null; then
    pkill -x autotiling
fi
if pgrep -x .autotiling-wra > /dev/null; then
    pkill -x .autotiling-wra
fi

autotiling &



if pgrep -x .nm-applet-wrapped > /dev/null; then
    pkill -x .nm-applet-wrapped
fi

nm-applet --indicator &