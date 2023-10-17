{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../../../programs/wayland
    ./scripts.nix
  ];
  programs = {
    dconf.enable = true;
    light.enable = true;
  };

  environment.systemPackages = with pkgs; [
    
    waybar # status bar
  ];

  # overlays
  # nixpkgs.overlays = [
  #   (self: super: {
  #     waybar = super.waybar.overrideAttrs (oldAttrs: {
  #       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  #     });
  #   })
  # ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-wlr 
    ];
  };
}