{
  programs.nixvim.plugins.markdown-preview = {
    enable = true;
    settings = {
      auto_close = false;
      auto_start = false;
      browser = "firefox";
      port = "8099";
      page_title = "「\${name}」";
      preview_options = {
        sync_scroll_type = "middle";
      };
      theme = "dark";
    };
  };
}
