{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      networkmanagerapplet
      blueman
    ];
  };
}