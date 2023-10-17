{ config, pkgs, user, inputs, ... }:

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
    ./communication
    ./obsidian
    ./utils
    ./mail
    ./3d-printing
    ./vpn
    ./neovim
    ./security
    ./python
    ./latex
    ./test
  ];
}