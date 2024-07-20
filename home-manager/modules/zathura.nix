{
  programs.zathura = {
    enable = true;

    options = {
      sandbox = "none";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 1;
      selection-clipboard = "clipboard";
    };

    mappings = {
      u = "scroll half-up";
      d = "scroll half-down";
      D = "toggle_page_mode";
      r = "reload";
      R = "rotate";
      K = "zoom in";
      J = "zoom out";
      i = "recolor";
      p = "print";
      g = "goto top";
      "[fullscreen] u" = "scroll half-up";
      "[fullscreen] d" = "scroll half-down";
      "[fullscreen] D" = "toggle_page_mode";
      "[fullscreen] r" = "reload";
      "[fullscreen] R" = "rotate";
      "[fullscreen] K" = "zoom in";
      "[fullscreen] J" = "zoom out";
      "[fullscreen] i" = "recolor";
      "[fullscreen] p" = "print";
      "[fullscreen] g" = "goto top";
    };
  };
}
