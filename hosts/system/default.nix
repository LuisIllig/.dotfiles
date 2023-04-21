{ config, pkgs, user, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./sound.nix
    ./scripts.nix
  ];

  # basic
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";

  # flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
    show-trace = true
  '';

  # nix
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
  };

  # basic programs
  environment = {
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      nano
      neofetch
      gnome.gnome-keyring
      xdg-utils # for opening default programs when clicking links
      glib # gsettings
    ];
  };

  # console
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "de";
  };

  # user
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  services.dbus.enable = true;
}