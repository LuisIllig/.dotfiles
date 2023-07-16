{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
    ];

    # add some custom keybinds
    # change delete line
  };
}