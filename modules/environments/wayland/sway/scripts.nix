{ config, pkgs, ... }:

let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" (builtins.readFile ../../../../scripts/startup/cava-internal.sh);
in
{
  environment.systemPackages = [
    cava-internal
  ];
}