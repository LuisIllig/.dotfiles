{ lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };

  home.file.".config/fish/fish_variables".text = import ./fish_variables.nix;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
  home.file.".config/fish/functions/l.fish".source = ./functions/l.fish;
}