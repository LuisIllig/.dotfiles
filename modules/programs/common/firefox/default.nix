{ config, pkgs, inputs, ... }:

{
   programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.default = {
      isDefault = true;
      id = 0;
      name = "Default";
      settings = import ./settings.nix;
      # userChrome = import ./userChrome.nix;
      # userContent = import ./userContent.nix;
      userChrome = import ./userChrome2.nix;
      bookmarks = import ./bookmarks.nix;
      search.default = "Startpage";
      search.force = true;
      search.engines = {
        "Startpage" = {
          urls = [{ template = "https://www.startpage.com/do/dsearch?query={searchTerms}";}];
          definedAliases = [ "@sp" ];
        };
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        "Nix Wiki" = {
          urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nw" ];
        };
        "Piped" = {
          urls = [{ template = "https://piped.yt/results?search_query={searchTerms}"; }];
          definedAliases = [ "@p" ];
        };
        "Bibliothek" = {
          urls = [{ template = "https://www.katalog.fh-zwickau.de/Search/Results?lookfor={searchTerms}&limit=20"; }];
          definedAliases = [ "@bib" ];
        };
        "Home-Manager" = {
          urls = [{ template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";}];
          definedAliases = [ "@hm" ];
        };
        "Nix Options" = {
          urls = [{ template = "https://search.nixos.org/options?query={searchTerms}"; }];
          definedAliases = [ "@no" ];
        };
        # "Wikipedia (en)".metaData.alias = [ "@w" ];
        "Google".metaData.hidden = true;
        "Amazon.de".metaData.hidden = true;
        "Bing".metaData.hidden = true;
        "DuckDuckGo".metaData.hidden = true;
      };
      # https://nur.nix-community.org/repos/rycee/
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        darkreader
        bypass-paywalls-clean
        istilldontcareaboutcookies
        keepassxc-browser
        decentraleyes
        redirector
        vimium
        privacy-badger
        no-pdf-download
      ];
    };
  };
}