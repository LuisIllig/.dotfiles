{ config, pkgs, ... }:

{
  services.avahi.enable = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;

  services.printing.enable = true;
  services.printing.browsing = true;
  services.printing.listenAddresses = [ "*:631" ];
  services.printing.allowFrom = [ "all" ];
  services.printing.defaultShared = true;

  networking.firewall.allowedUDPPorts = [ 631 ];
  networking.firewall.allowedTCPPorts = [ 631 ];
  networking.firewall.extraCommands = ''
      iptables -I INPUT -p udp --dport mdns -d 224.0.0.120 -j ACCEPT   # zeroconf
      iptables -I OUTPUT -p udp --dport mdns -d 224.0.0.120 -j ACCEPT  # zeroconf
  '';

  environment = {
    systemPackages = with pkgs; [
      cups
      gtklp # manage printing queue
      system-config-printer # manage printers
    ];
  };
}