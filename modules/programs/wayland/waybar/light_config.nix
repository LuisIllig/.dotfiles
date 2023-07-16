[
  {
    "backlight": {
      "device": "intel_backlight",
      "format": "{icon} {percent}%",
      "format-icons": [
        "",
        "",
        "",
        ""
      ],
      "on-scroll-down": "light -U 5",
      "on-scroll-up": "light -A 5"
    },
    "battery": {
      "format": "{icon} {capacity}%",
      "format-charging": " {capacity}%",
      "format-full": "{icon} {capacity}%",
      "format-icons": [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
      ],
      "interval": 10,
      "states": {
        "critical": 10,
        "warning": 20
      },
      "tooltip": false
    },
    "clock": {
      "format": "{:%I:%M %p  %A %b %d}",
      "interval": 1,
      "tooltip": true,
      "tooltip-format": "上午：高数\n下午：Ps\n晚上：Golang\n<tt>{calendar}</tt>"
    },
    "cpu": {
      "format": " {usage}%",
      "interval": 1
    },
    "custom/cava-internal": {
      "exec": "sleep 1s && cava-internal",
      "tooltip": false
    },
    "custom/launcher": {
      "format": " ",
      "on-click": "pkill rofi || ~/.config/rofi/launcher.sh",
      "tooltip": false
    },
    "custom/wall": {
      "on-click": "wallpaper_random",
      "on-click-middle": "default_wall",
      "on-click-right": "killall dynamic_wallpaper || dynamic_wallpaper &",
      "format": " ﴔ ",
      "tooltip": false
    },
    "custom/powermenu": {
      "format": "",
      "on-click": "pkill rofi || ~/.config/rofi/powermenu.sh",
      "tooltip": false
    },
    "idle_inhibitor": {
      "format": "{icon}",
      "format-icons": {
        "activated": "",
        "deactivated": ""
      },
      "tooltip": false
    },
    "memory": {
      "format": "﬙ {percentage}%",
      "interval": 1,
      "states": {
        "warning": 85
      }
    },
    "modules-center": [
      "clock"
    ],
    "modules-left": [
      "custom/launcher",
      "sway/workspaces",
      "temperature",
      //"idle_inhibitor",
      "custom/wall",
      "mpd",
      "custom/cava-internal"
    ],
    "modules-right": [
      "pulseaudio",
      "backlight",
      "memory",
      "cpu",
      "network",
      "battery",
      "custom/powermenu",
      "tray"
    ],
    "mpd": {
      "format": "<span foreground='#FF99FF'></span> {title}",
      "format-disconnected": "",
      "format-paused": " {title}",
      "format-stopped": "<span foreground='#bb9af7'></span>",
      "max-length": 25,
      "on-click": "mpc --quiet toggle",
      "on-click-middle": "kitty --class='ncmpcpp' ncmpcpp ",
      "on-click-right": "mpc update; mpc ls | mpc add",
      "on-scroll-down": "mpc --quiet next",
      "on-scroll-up": "mpc --quiet prev",
      "smooth-scrolling-threshold": 5,
      "tooltip-format": "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})"
    },
    "network": {
      "format-disconnected": "說 Disconnected",
      "format-ethernet": "  {ifname} ({ipaddr})",
      "format-linked": "說 {essid} (No IP)",
      "format-wifi": "說 {essid}",
      "interval": 1,
      "tooltip": false
    },
    "position": "top",
    "pulseaudio": {
      "format": "{icon} {volume}%",
      "format-icons": {
        "default": [
          "",
          "",
          ""
        ]
      },
      "format-muted": "婢 Muted",
      "on-click": "pamixer -t",
      "scroll-step": 1,
      "states": {
        "warning": 85
      },
      "tooltip": false
    },
    "temperature": {
      "format": " {temperatureC}°C",
      "tooltip": false
    },
    "tray": {
      "icon-size": 15,
      "spacing": 5
    },
    "sway/workspaces": {
      "disable-scroll": true,
    }
  }
]