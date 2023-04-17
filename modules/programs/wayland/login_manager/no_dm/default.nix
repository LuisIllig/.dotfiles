{ config, pkgs, ... }:

{
  programs.bash.loginShellInit = ''
    sway
  '';
}