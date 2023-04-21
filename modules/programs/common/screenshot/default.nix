{ config, pkgs, user, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        showHelp = false;
        savePath = "/home/${user}/Pictures/Screenshots";
        autoCloseIdleDaemon = false;
        savePathFixed=true;
        filenamePattern = "%F_%T";
      };
    };
  };
}