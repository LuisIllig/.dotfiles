{ config, lib, pkgs, user, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./sound.nix
    ./scripts.nix
    ./printing.nix
    #./network-drives.nix
  ];

  # services.pufferpanel = {
  #   enable = true;
  #   extraPackages = with pkgs; [ bash curl gawk gnutar gzip ];
  #   package = pkgs.buildFHSEnv {
  #     name = "pufferpanel-fhs";
  #     runScript = lib.getExe pkgs.pufferpanel;
  #     targetPkgs = pkgs': with pkgs'; [ icu openssl zlib ];
  #   };
  # };

  # basic
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";

  # flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    warn-dirty = false
    show-trace = false
  '';

  # nix2
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
      # gnome.gnome-keyring
      xdg-utils # for opening default programs when clicking links
      glib # gsettings
      gnome.gnome-disk-utility # formatting disks / gnome-disks
      file # file -bi filename
      # pufferpanel
      polkit
      polkit_gnome
    ];
  };

  services.gnome.gnome-keyring.enable = true;

  # console
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "de";
  };

  # user
  users.users.${user} = {
    useDefaultShell = true;
    isNormalUser = true;
    extraGroups = [ "audio" "sound" "video" "networkmanager" "wheel" "uinput" "libvirtd" ];
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  services.dbus.enable = true;
  
  # automount
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # xdg.portal.config

  # services.postgresql = {
  #   enable = true;
  #   ensureDatabases = [ "wikijs" ];
  #   authentication = pkgs.lib.mkOverride 10 ''
  #     #type database  DBuser  auth-method
  #     local all       all     trust
  #   '';
  #   ensureUsers = [
  #     {
  #       name = "wikijs";
  #       ensureDBOwnership = true;
  #     }
  #   ];
  # };

  # services.wiki-js = {
  #   enable = true;
  #   settings = {
  #     bindIp = "127.0.0.1";
  #     port = 3000;

  #     db = {
  #       db   = "wikijs";
  #       user = "wikijs";
  #       host = "/run/postgresql";
  #     };
  #   };
  # };
}