{ config, pkgs, ... }:

{
  programs.gpg.package = pkgs.gnupg;
  programs.gpg.enable = true;
  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "gnome3";
      enableSshSupport = true;
    };
    gnome-keyring.enable = true;
  };
}