{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      python310Full
      python310Packages.opencv4
      python310Packages.tkinter
    ];
  };
}