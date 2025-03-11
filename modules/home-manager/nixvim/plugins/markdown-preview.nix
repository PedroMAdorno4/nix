{
  programs.nixvim.plugins.markdown-preview = {
    enable = true;
    settings = {
      browser = "zen";
      port = "8099";
      page_title = "「\${name}」";
      preview_options = {
        sync_scroll_type = "middle";
      };
      theme = "dark";
    };
  };
}
