{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cava
      mpc-cli
    ];
  };
  programs = {
    ncmpcpp = {
      enable = true;
      mpdMusicDir = null;
    };
  };
  home.file = {
    ".config/ncmpcpp/config".text = ''
      mpd_music_dir = ~/Music
    '';
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
    };
  };
}