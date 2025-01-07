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
    };

    keybindings = {
      "alt+k" = "scroll_line_up";
      "alt+j" = "scroll_line_down";
      "alt+u" = "scroll_page_up";
      "alt+d" = "scroll_page_down";
      "alt+shift+k" = "change_font_size all +1.0";
      "alt+shift+j" = "change_font_size all -1.0";
      "alt+shift+home" = "change_font_size all 0";
      "alt+c" = "copy_to_clipboard";
      "alt+v" = "paste_from_clipboard";
      "ctrl+t" = "new_window_with_cwd";
    };

    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}
