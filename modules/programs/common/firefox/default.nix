{ config, pkgs, ... }:

{
  programs.firefox = 
  let
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      darkreader
      bypass-paywalls-clean
    ];
  in
  {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.default = {
      # inherit extensions;
      isDefault = true;
      id = 0;
      name = "Default";
      # settings should be compared to current ws
      settings = {
        # Enable HTTPS-Only Mode
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;

        # Privacy settings
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;

        # Disable all sorts of telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        # As well as Firefox 'experiments'
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;

        # Disable Pocket Integration
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
      };

      userChrome = ''
        #sidebar-box,
        .sidebar-panel[lwt-sidebar-brighttext] {
          background-color: var(--base_color1) !important;
        }
        #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
          display: none; /* remove sidebar header */
          border-color: var(--base_color2) !important;
        }

        .sidebar-splitter {
          /* display: none;  remove sidebar split line */
          min-width: 1px !important;
          max-width: 1px !important;
          border-color: var(--base_color2) !important;
        }

        #titlebar { visibility: collapse !important; }

        #urlbar .urlbar-input-box {
          text-align: center !important;
        }

        * {
        font-family: JetBrainsMono Nerd Font Mono !important;
        font-size: 12pt !important;
        }

        #TabsToolbar > * {
          visibility: collapse;
        }

        /* hide navigation bar when it is not focused; use Ctrl+L to get focus */
        #main-window:not([customizing]) #navigator-toolbox:not(:focus-within):not(:hover) {
          margin-top: -45px;
        }
        #navigator-toolbox {
          transition: 0.2s margin-top ease-out;
        }
      '';

      userContent = ''
        * {
          font-family: JetBrainsMono Nerd Font Mono;
        }

        @-moz-document url-prefix("about:") {
          :root {
            --in-content-page-background: #1E1E2E !important;
          }
        }

        @-moz-document url-prefix(about:home), url-prefix(about:newtab){

          .search-wrapper .logo-and-wordmark .logo {
            background: url("${./nix-snowflake.svg}") no-repeat center !important;
            background-size: auto !important;
            background-size: 82px !important;
            display: inline-block !important;
            height: 82px !important;
            width: 82px !important;
          }

          body {
            background-color: #000000 !important;
            background: url("${./ff_bg.png}") no-repeat fixed !important;
            background-size: cover !important;
            --newtab-background-color: #000000 !important;
            --newtab-background-color-secondary: #101010 !important;
          }

          body[lwt-newtab-brighttext] {
            --newtab-background-color: #000000 !important;
            --newtab-background-color-secondary: #101010 !important;

          }

          .top-site-outer .top-site-icon {
            background-color: transparent !important;

          }

          .top-site-outer .tile {
            background-color: rgba(49, 49, 49, 0.4) !important;
          }

          .top-sites-list:not(.dnd-active) .top-site-outer:is(.active, :focus, :hover) {
            background: rgba(49, 49, 49, 0.3) !important;
          }

          .top-site-outer .context-menu-button:is(:active, :focus) {
            background-color: transparent !important;
          }

          .search-wrapper .search-handoff-button{
            border-radius: 40px !important;
            background-color: rgba(49, 49, 49, 0.4) !important;
          }
        }
      '';
    };
  };
}