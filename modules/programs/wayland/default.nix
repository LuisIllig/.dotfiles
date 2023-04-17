{ config, pkgs, ... }:

{
  imports = [
    ./login_manager/no_dm
  ];
}