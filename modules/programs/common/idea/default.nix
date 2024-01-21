{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      jetbrains.idea-ultimate
      # bluej
      godot_4
      # https://github.com/NixOS/nixpkgs/issues/265309
      freecad
      jetbrains.pycharm-professional
    ];
  };
}
