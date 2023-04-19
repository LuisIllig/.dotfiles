[
  {
    modules-left = [
      "custom/launcher"
      "sway/workspaces"
      # "temperature"
      # "custom/wall"
      "mpd"
      "custom/cava-internal"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "pulseaudio"
      "backlight"
      "memory"
      "cpu"
      "network"
      "battery"
      "custom/powermenu"
      "tray"
    ];
    "custom/launcher" = {
      "format" = " ";
      "on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";
      "tooltip" = false;
    };
    # "custom/wall" = {
    #   "on-click" = "wallpaper_random";
    #   "on-click-middle" = "default_wall";
    #   "on-click-right" = "killall dynamic_wallpaper || dynamic_wallpaper &";
    #   "format" = " ﴔ ";
    #   "tooltip" = false;
    # };
    "custom/cava-internal" = {
      "exec" = "cava-internal";
      "tooltip" = false;
    };
    "sway/workspaces" = {
      "disable-scroll" = true;
    };
    "backlight" = {
      "on-scroll-up" = "light -A 5";
      "on-scroll-down" = "light -U 5";
      "format" = "{icon} {percent}%";
      "format-icons" = [ "" "" "" "" ];
    };
    "pulseaudio" = {
      "scroll-step" = 1;
      "format" = "{icon} {volume}%";
      "format-muted" = "婢 Muted";
      "format-icons" = {
        "default" = [ "" "" "" ];
      };
      "states" = {
        "warning" = 85;
      };
      "on-click" = "pamixer -t";
      "tooltip" = false;
    };
    "battery" = {
      "interval" = 10;
      "states" = {
        "warning" = 20;
        "critical" = 10;
      };
      "format" = "{icon} {capacity}%";
      "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
      "format-full" = "{icon} {capacity}%";
      "format-charging" = " {capacity}%";
      "format-alt" = "{time} {icon}";
      "tooltip" = false;
    };
    "clock" = {
      "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      "format-alt" = "{:%d-%m-%Y}";
      "locale" = "en_US.UTF-8";
    };
    "memory" = {
      "interval" = 1;
      "format" = "﬙ {percentage}%";
      "states" = {
        "warning" = 85;
      };
    };
    "cpu" = {
      "interval" = 1;
      "format" = " {usage}%";
    };
    "mpd" = {
      "max-length" = 25;
      "format" = "<span foreground='#bb9af7'></span> {title}";
      "format-paused" = " {title}";
      "format-stopped" = "<span foreground='#bb9af7'></span>";
      "format-disconnected" = "";
      "on-click" = "mpc --quiet toggle";
      "on-click-right" = "mpc update; mpc ls | mpc add";
      "on-click-middle" = "kitty ncmpcpp";
      "on-scroll-up" = "mpc --quiet prev";
      "on-scroll-down" = "mpc --quiet next";
      "smooth-scrolling-threshold" = 5;
      "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
    };
    "network" = {
      "interval" = 1;
      "format-wifi" = "說 {essid}";
      "format-ethernet" = "  {ifname} ({ipaddr})";
      "format-linked" = "說 {essid} (No IP)";
      "format-disconnected" = "說 Disconnected";
      "on-click" = "nm-connection-editor";
      "tooltip" = false;
    };
    # "temperature" = {
    #   # "hwmon-path"= "${env:HWMON_PATH}";
    #   #"critical-threshold"= 80;
    #   "tooltip" = false;
    #   "format" = " {temperatureC}°C";
    # };
    "custom/powermenu" = {
      "format" = "";
      "on-click" = "pkill rofi || ~/.config/rofi/powermenu.sh";
      "tooltip" = false;
    };
    "tray" = {
      "icon-size" = 15;
      "spacing" = 5;
    };
  }
]