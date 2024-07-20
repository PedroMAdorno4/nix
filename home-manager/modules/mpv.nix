{
  programs.mpv = {
    enable = true;

    bindings = {
      h = "no-osd seek -3 exact";
      l = "no-osd seek 3 exact";
      LEFT = "no-osd seek -3 exact";
      RIGHT = "no-osd seek 3 exact";
      j = "seek -10";
      k = "seek 10";
      s = "cycle sub";
      a = "cycle audio";
      HOME = "add chapter -1";
      END = "add chapter 1";
    };

    profiles = {
      wallpaper = {
        fullscreen = true;
        title = "mpv-wallpaper";
        geometry = "100%x100%";
        border = false;
        no-window-dragging = true;
        x11-name = "mpv-wallpaper";
        aid = false;
        vo = "gpu";
        loop-file = true;
        idle = false;
      };
    };

  };
}
