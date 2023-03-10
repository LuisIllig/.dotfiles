{ config, pkgs, ... }:

{
  imports = [
    ./gpg
    ./firefox
    ./vscodium
    ./kitty
    ./neofetch
  ];
}