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
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker # color picker
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast # screenshots
    waybar # status bar
  ];

  # overlays
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}