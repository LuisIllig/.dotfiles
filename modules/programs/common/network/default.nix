{ config, pkgs, ... }:

{
  services.blueman-applet.enable = true;
  home = {
    packages = with pkgs; [
      networkmanagerapplet
      # blueman
    ];
  };
}