{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      python310Packages.opencv4
    ];
  };
}