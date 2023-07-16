{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      tdesktop
      element-desktop
      signal-desktop
      teamspeak_client
    ];
  };
}