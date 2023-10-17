{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  programs.nm-applet.enable = false;

  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [ 80 8080 403 1701 9001 ];
  #   # allowedUDPPortRanges = [
  #   #   { from = 1700; to = 1702; }
  #   #   { from = 9000; to = 9002; }
  #   # ];
  # };
  # networking.firewall.allowPing = true;
  networking.firewall.enable = false;
  programs.weylus.openFirewall = true;
  programs.weylus.enable = true;
  # networking.firewall.enable = false;

   environment = {
    systemPackages = with pkgs; [
      weylus
    ];
  };
}