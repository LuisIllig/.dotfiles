{ config, pkgs, ... }:

{
  programs.gpg.package = pkgs.gnupg;
  programs.gpg.enable = true;
  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "gtk2";
      enableSshSupport = true;
    };
  };
}