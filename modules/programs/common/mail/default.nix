{ config, pkgs, ... }:

{
  programs.thunderbird.enable = true;
  programs.thunderbird.profiles.default = {
    isDefault = true;
    settings = {};
  };
}