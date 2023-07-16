{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  programs.nm-applet.enable = false;

  # wireguard
  environment.systemPackages = [ pkgs.wireguard-tools ];
  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 23 51820 ]; # Clients and peers can use the same port, see listenport
  };

  networking.firewall = {
   # if packets are still dropped, they will show up in dmesg
  logReversePathDrops = true;
   # wireguard trips rpfilter up
  extraCommands = ''
    ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
    ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
  '';
  extraStopCommands = ''
    ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
    ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
  '';
  };
}