{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/home/shyiyn/mnt/fhz/information" = {
      device = "//WHZ-FFak-00.zw.fh-zwickau.de/Information";
      fsType = "cifs";
      options = let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };
}