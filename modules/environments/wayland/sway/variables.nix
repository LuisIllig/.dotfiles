{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
      BROWSER = "firefox";
      TERMINAL = "kitty";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_SCALE_FACTOR = "1";
      MOZ_ENABLE_WAYLAND = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      # WLR_NO_HARDWARE_CURSORS = "1"; # if no cursor,uncomment this line  
      CLUTTER_BACKEND = "wayland";
      WLR_RENDERER = "vulkan";
      #__NV_PRIME_RENDER_OFFLOAD="1";
      XDG_CURRENT_DESKTOP = "sway";
      XDG_SESSION_DESKTOP = "sway";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
