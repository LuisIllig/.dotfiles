{ config, pkgs, ... }:

{
  imports = [
    ./notification
    ./waybar
    ./launcher
    ./tiling
  ];
}