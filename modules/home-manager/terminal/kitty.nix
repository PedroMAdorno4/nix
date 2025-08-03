{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "jetbrains mono nerd font";
      font_size = 9;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      mouse_hide_wait = "2.0";
      cursor_shape = "block";
      cursor_trail = 3;
      scrollback_lines = 100000;
      enable_audio_bell = false;
      update_check_interval = 0;
      url_color = "#0087bd";
      url_style = "dotted";
      background_blur = 0;

      #Close the terminal without confirmation
      confirm_os_window_close = 0;

      kitty_mod = "alt";
    };

    keybindings = {
      # Scrolling
      "kitty_mod+k" = "scroll_line_up";
      "kitty_mod+j" = "scroll_line_down";
      "kitty_mod+u" = "scroll_page_up";
      "kitty_mod+d" = "scroll_page_down";

      # Font
      "kitty_mod+shift+k" = "change_font_size all +1.0";
      "kitty_mod+shift+j" = "change_font_size all -1.0";
      "kitty_mod+shift+home" = "change_font_size all 0";

      # Clipboard
      "kitty_mod+c" = "copy_to_clipboard";
      "kitty_mod+v" = "paste_from_clipboard";

      # Tabs
      "kitty_mod+t" = "new_tab";
      "kitty_mod+l" = "next_tab";
      "kitty_mod+h" = "previous_tab";
      "kitty_mod+shift+l" = "move_tab_forward";
      "kitty_mod+shift+h" = "move_tab_backward";
    };

    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}
