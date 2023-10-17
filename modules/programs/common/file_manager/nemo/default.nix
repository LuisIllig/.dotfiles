{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cinnamon.nemo-with-extensions
      p7zip
      cinnamon.nemo-fileroller
    ];
  };
}