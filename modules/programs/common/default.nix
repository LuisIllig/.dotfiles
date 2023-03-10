{ config, pkgs, ... }:

{
  imports = [
    ./gpg
    ./firefox
    ./vscodium
  ];
}