{ config, pkgs, ... }:

{
  imports = [
    ./kitty
    ./fish
    ./gtk
    ./rofi
    ./btop
  ];
}