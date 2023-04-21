{ config, pkgs, ... }:

{
  imports = [
    ./notification
    ./waybar
    ./launcher
    ./tiling
    ./image_viewer
  ];
}