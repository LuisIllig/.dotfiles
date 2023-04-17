{ config, lib, pkgs, ... }:

{
  imports = [ ../../../programs/wayland/home.nix ];

  home = {
    packages = with pkgs; [
      swaybg
      swayidle
      swaylock-effects
      pamixer # cl audio
      wev # keyboard event viewer 
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      wayland
      wayland-utils
      xwayland
      wayland-protocols
      wayland-scanner
      grim # screenshot
      pkgs.sway-contrib.grimshot # screenshot
      flameshot # screenshot
      wf-recorder # screen recorder
      dracula-theme # gtk theme
    ];
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = null;
    extraConfig = builtins.readFile ../../../../config/sway/config;
  };
}