{ config, pkgs, ... }:

{
  home.file.".config/fish/conf.d/mocha.fish".text = import ./conf.d/mocha_theme.nix;
}
