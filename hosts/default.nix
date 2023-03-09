{ config, pkgs, ... }:

{
  imports =
    [
      ./laptop/hardware-configuration.nix
    ] ++ [
      ./system
    ] ++ [
      ./environment/plasma
    ];

  users.users.shyiyn = {
    isNormalUser = true;
    description = "shyiyn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      vscode
      git
      gnupg
    ];
  };
}
