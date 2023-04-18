{ config, pkgs, ... }:

{
  imports = [
    ./gpg
    ./firefox
    ./vscodium
    ./kitty
    ./neofetch
    ./git
    ./btop
    ./idea
    ./file_manager
    ./network
    ./music
  ];
}