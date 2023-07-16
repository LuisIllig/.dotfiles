{ config, pkgs, ... }:

let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" (builtins.readFile ../../../../scripts/wayland/cava-internal.sh);
  custom-swaylock = pkgs.writeShellScriptBin "custom-swaylock" (builtins.readFile ../../../../scripts/wayland/custom-swaylock.sh);
  custom-swaylock-suspend = pkgs.writeShellScriptBin "custom-swaylock-suspend" (builtins.readFile ../../../../scripts/wayland/custom-swaylock-suspend.sh);
  restart-sway-components = pkgs.writeShellScriptBin "restart-sway-components" (builtins.readFile ../../../../scripts/wayland/restart-sway-components.sh);
  swww-init = pkgs.writeShellScriptBin "swww-init" (builtins.readFile ../../../../scripts/wayland/swww-init.sh);
in
{
  environment.systemPackages = [
    cava-internal
    custom-swaylock
    custom-swaylock-suspend
    restart-sway-components
    swww-init
  ];
}