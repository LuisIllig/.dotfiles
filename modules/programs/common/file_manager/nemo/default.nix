{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cinnamon.nemo
      p7zip
    ];
  };
}