{
  programs.nixvim.plugins.flutter-tools = {
    enable = true;
    settings = {
      closing_tags = {
        enabled = false;
        highlight = "ErrorMsg";
        prefix = ">";
        priority = 10;
      };
      decorations = {
        statusline = {
          app_version = true;
          device = true;
        };
      };
      dev_tools = {
        auto_open_browser = true;
        autostart = true;
      };
      lsp = {
        color = {
          enabled = true;
        };
      };
      widget_guides = {
        enabled = true;
      };
    };
  };
}
