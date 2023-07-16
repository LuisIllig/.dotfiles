{ lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };

  home = {
    packages = with pkgs; [
      krabby
    ];
  };

  home.file.".config/fish/fish_variables".text = import ./fish_variables.nix;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
  home.file.".config/fish/functions/l.fish".source = ./functions/l.fish;
  home.file.".config/fish/functions/fish_greeting.fish".source = ./functions/fish_greeting.fish;
}