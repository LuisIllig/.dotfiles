{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.wireless.iwd.enable = true;
  # networking.networkmanager.wifi.backend = "iwd";
  programs.nm-applet.enable = false;

  # networking.wireless.networks."37C3".auth = ''
  #   key_mgmt=WPA-EAP
  #   eap=TTLS
  #   identity="37C3"
  #   password="37C3"
  #   ca_cert="${builtins.fetchurl {
  #     url = "https://letsencrypt.org/certs/isrgrootx1.pem";
  #     sha256 = "sha256:1la36n2f31j9s03v847ig6ny9lr875q3g7smnq33dcsmf2i5gd92";
  #   }}"
  #   altsubject_match="DNS:radius.c3noc.net"
  #   phase2="auth=PAP"
  # '';
}