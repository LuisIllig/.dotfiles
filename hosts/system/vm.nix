{ config, pkgs, ... }:

{  
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true; # virt-manager requires dconf to remember settings
  environment.systemPackages = with pkgs; [ virt-manager ];

  dconf.settings = {
  "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
    };
  };
}