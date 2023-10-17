{ config, pkgs, ... }:

{
  # ref https://github.com/catppuccin/gtk
  home = {
    packages = with pkgs; [
      gnome.gnome-themes-extra
    ];
  };
  home.sessionVariables = {
    GTK_THEME = "Nordic-darker";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Frappe-Dark";
    size = 16;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
    cursorTheme = {
      name = "Catppuccin-Frappe-Dark";
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
  };
}