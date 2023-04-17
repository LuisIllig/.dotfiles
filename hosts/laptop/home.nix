{ config, lib, pkgs, user, ... }:

{
  imports = [
    (import ../../modules/environments/wayland/sway/home.nix)
  ] ++ [
    (import ../../modules/programs/common)
  ] ++ [
    (import ../../modules/themes/catppuccin-dark/common)
  ] ++ [
    (import ../../modules/shell)
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "22.11";
}