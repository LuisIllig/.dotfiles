{ config, pkgs, ... }:

{
  imports = [
    ./gpg
    ./firefox
  ];
}