{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      openscad
    ];
  };
}