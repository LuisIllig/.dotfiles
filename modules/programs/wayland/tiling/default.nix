{ config, pkgs, ... }:

{
  # environment.systemPackages = [
  #   pkgs.autotiling
  # ];
  home = {
    packages = with pkgs; [
      autotiling
    ];
  };
}