{
  programs.nixvim.plugins.flutter-tools = {
    enable = true;
    settings = {
      closing_tags = {
        enabled = true;
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

        settings = {
          showTodos = true;
          completeFunctionCalls = true;
          renameFilesWithClasses = "prompt";
          enableSnippets = true;
          updateImportsOnRename = true;
        };
      };
      widget_guides = {
        enabled = true;
      };
    };
  };
}
