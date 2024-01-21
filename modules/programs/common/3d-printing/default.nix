{ config, pkgs, user, ... }:

{
  imports = [
    # ./cura.nix
    ./openscad.nix
  ];
}