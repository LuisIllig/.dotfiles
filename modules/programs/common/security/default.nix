{ config, pkgs, user, ... }:

{
  imports = [
    ./nitrokey.nix
    ./keepassxc.nix
  ];
}