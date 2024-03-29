{ config, pkgs, ... }:

{
  # ref https://github.com/catppuccin/gtk
  home = {
    packages = with pkgs; [
      gnome.gnome-themes-extra
      gtk-engine-murrine
    ];
  };
  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Macchiato-Compact-Lavender-dark";
  };
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-Frappe-Dark";
    size = 16;
  };
  home.pointerCursor.gtk.enable = true;
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Lavender-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
      };
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