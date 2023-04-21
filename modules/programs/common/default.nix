{ config, pkgs, user, ... }:

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
    ./media_player
    ./screenshot
  ];
}