''
  * {
    font-family: JetBrainsMono Nerd Font Mono;
  }

  @-moz-document url-prefix("about:") {
    :root {
      --in-content-page-background: #1E1E2E !important;
      color: #F5E0DC;
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
      color: #F5E0DC;
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
''