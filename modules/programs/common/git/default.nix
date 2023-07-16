{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "LuisIllig";
    userEmail = "Luis.Illig@protonmail.com";
  };
}