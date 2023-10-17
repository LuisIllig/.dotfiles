''
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
''
  #TabsToolbar,#nav-bar{ height: 32px !important; }
#TabsToolbar{margin-left:28vw !important;margin-right:44px; }
#TabsToolbar,#tabbrowser-tabs{background-color:rgb(50, 50, 52) !important}
#nav-bar{margin-top:-32px !important;margin-right: 70vw!important;}
#PanelUI-button{position: fixed;top:2px;right:144px;}