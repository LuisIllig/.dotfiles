{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      protonvpn-cli
      openconnect
      networkmanager-openconnect
    ];
  };
}