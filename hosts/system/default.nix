{ config, pkgs, user, ... }:

{
  imports = [
    ./boot.nix
  ] ++ [
    ./locale.nix
  ] ++ [
    ./sound.nix
  ] ++ [
    ./networking.nix
  ];

  # basic
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";

  # flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
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
  environment.systemPackages = with pkgs; [
    nano
    git
    gnupg
  ];

  # temp gnupg
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gtk2";
    enableSSHSupport = true;
  };

  # console
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    keyMap = "de";
  };

  # temp
  users.users.${user} = {
    isNormalUser = true;
    description = "shyiyn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vscode
      git
      gnupg
    ];
  };
}