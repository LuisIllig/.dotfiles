{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      pkgs.texlive.combined.scheme-full
    ];
  };
}