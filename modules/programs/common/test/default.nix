{ config, pkgs, ... }:

{
  # home.file."bin/hello-world" = {
  #   source = ''
  #     echo ${pkgs.nmap}
  #   '';
  #   executable = true;
  # };
  home = {
    packages = with pkgs; [
      hedgedoc
      discord
      libreoffice
      zap
      nmap
      calibre
      lxappearance-gtk2
      tk
      podman
      podman-desktop
      gimp
      # currently marked as broken
      # shadered
      kodelife
      lazygit
      nim
      gopass
      ansible
      #TERM=xterm-256color ssh -4 caoimhe
      anki
      pandoc
      # brave
      # flutter
      # android-tools
      # android-studio
      # arandr
      pdfarranger
      krita
      xournal
      lorien
      xournalpp
      darktable
      dpkg
      libsForQt5.qt5.qtwayland
      rclone
      appflowy
      logseq
      libsForQt5.qt5.qtwayland
      cargo
      unetbootin
      woeusb
      gnome-multi-writer
      anki-sync-server
      freecad
      protonvpn-gui
      nvtop
    ];
  };
}