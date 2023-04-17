{ config, pkgs, ... }:

let
  apply-system = pkgs.writeShellScriptBin "apply-system" (builtins.readFile ../../scripts/nix/apply-system.sh);
  test-system = pkgs.writeShellScriptBin "test-system" (builtins.readFile ../../scripts/nix/test-system.sh);
  update-system = pkgs.writeShellScriptBin "update-system" (builtins.readFile ../../scripts/nix/update-system.sh);
in
{
  environment.systemPackages = [
    apply-system
    test-system
    update-system
  ];
}