{ config, lib, pkgs, user, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = import ./style.nix;
    settings = import ./settings.nix;
  };
  # home.file = {
  #   ".config/waybar/light_config".text = import ./light_config.nix;
  #   ".config/waybar/light_style.css".text = import ./light_config.css.nix;
  # };
  # home.file = {
  #   ".config/waybar/nord_config".text = import ./nord_config.nix;
  #   ".config/waybar/nord_style.css".text = import ./nord_config.css.nix;
  # };
}
