{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      jetbrains.idea-ultimate
      bluej
      godot_4
      freecad
      python3
    ];
  };
}
