{ config, lib, pkgs, ... }:

let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    # avoid wait before login
    exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK
    
    # `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.
    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; swaymsg exit"
    
    bindsym Mod4+shift+e exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'
      
    output "*" bg ~/.dotfiles/imgs/png_01.jpg fill

    input "type:keyboard" xkb_layout "de"
    input "type:touchpad" {
      dwt enabled
      tap enabled
      middle_emulation enabled
    }
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
  '';
}