{ config, pkgs, ... }:

{
  imports = [
    ./kitty
    ./fish
    ./gtk/nordic.nix
    ./rofi
    ./btop
    ./cava
  ];
}