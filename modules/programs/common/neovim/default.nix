{ config, pkgs, ... }:

{
  # programs.neovim.enable = true;
  # programs.neovim.plugins = with pkgs; [
  #   vimPlugins.lightline-vim
  #   vimPlugins.nvchad
  #   vimPlugins.nvchad-ui
  # ];
  # programs.neovim.viAlias = true;
  # programs.neovim.vimAlias = true;
  programs.nixvim = {
    enable = true;

    # colorschemes.gruvbox.enable = true;
    plugins.lightline.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      nvchad
      #nvchad-ui
    ];
    extraConfigLua = ''
      -- Print a little welcome message when nvim is opened!
      print("Hello world!")
    '';
  };
}