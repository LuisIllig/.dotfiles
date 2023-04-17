{ config, lib, pkgs, ... }:

{
imports = [ ../../../programs/wayland ];
programs = {
    dconf.enable = true;
    light.enable = true;
  };

  security.pam.services.swaylock = { };
  security.polkit.enable = true;
  
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };
}