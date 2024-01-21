{ config, lib, pkgs, inputs, ... }:

{
  imports = [ 
    ../../../programs/wayland/home.nix
    ./variables.nix
    ];

  home = {
    packages = with pkgs; [
      hyprpicker
      inputs.hypr-contrib.packages.${pkgs.system}.grimblast # screenshots
      swayidle
      swaylock-effects
      wev # keyboard event viewer 
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      wayland
      wayland-utils
      xwayland
      wayland-protocols
      wayland-scanner
      # grim # screenshot
      # pkgs.sway-contrib.grimshot # screenshot
      # flameshot # screenshot
      wf-recorder # screen recorder
      pamixer
      swww
      wlroots
      wlr-randr
      wlr-protocols
      wayout
    ];
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = builtins.readFile ../../../../config/hyprland/config;
  };
}