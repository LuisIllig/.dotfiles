{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      hedgedoc
      discord
      libreoffice
      zap
      nmap
      calibre
      lxappearance-gtk2
    ];
  };
}