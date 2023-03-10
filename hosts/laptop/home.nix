{ config, lib, pkgs, user, ... }:

{
  imports = [
    (import ../../modules/programs/common)
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