{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "arrows-of-time";
    userEmail = "arrows-of-time@proton.me";
  };
}