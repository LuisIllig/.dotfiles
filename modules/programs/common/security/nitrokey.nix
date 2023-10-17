{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      pynitrokey
      libnitrokey
    ];
  };
}