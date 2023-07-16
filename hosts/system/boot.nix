{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # nix boot logo
  # doesn't seem to work at the moment ? very short flash of logo -> luks
  # boot.plymouth.enable = true;
  # boot.plymouth.themePackages = [ pkgs.catppuccin-plymouth ];
  # boot.plymouth.theme = "catppuccin-macchiato";
}