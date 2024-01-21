{ lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      l = "lsd -hla";
      ls = "lsd -ha";
    };
    plugins = [
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "85503fbc4b6026c616dd5dc8ebb4cfb82e1ef16c";
          sha256 = "s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
        };
      }
      {
        name = "autopair";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "244bb1ebf74bf944a1ba1338fc1026075003c5e3";
          sha256 = "s1o188TlwpUQEN3X5MxUlD/2CFCpEkWu83U9O+wg3VU=";
        };
      }
    ];
  };

  services.gpg-agent.enableFishIntegration = true;

  home = {
    packages = with pkgs; [
      krabby
      lsd
    ];
  };

  home.file.".config/fish/fish_variables".text = import ./fish_variables.nix;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./functions/fish_prompt.fish;
  home.file.".config/fish/functions/fish_greeting.fish".source = ./functions/fish_greeting.fish;
  # home.file.".config/fish/functions/l.fish".source = ./functions/l.fish;
  # home.file.".config/fish/functions/ssh.fish".source = ./functions/ssh.fish;
}