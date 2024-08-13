{
  wayland.windowManager.hyprland.settings = {
    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input = {
      kb_layout = "us";
      kb_variant = "intl";
      repeat_rate = 50;
      repeat_delay = 250;

      follow_mouse = 1;

      touchpad = {
        natural_scroll = false;
      };

      sensitivity = 0.0; # -1.0 - 1.0, 0 means no modification.
    };

    debug = {
      disable_logs = false;
    };

    general = {
      gaps_in = 8;
      gaps_out = 8;
      border_size = 2;

      layout = "dwindle";
    };

    misc = {
      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
      animate_manual_resizes = true;
      disable_splash_rendering = true;
    };

    decoration = {
      rounding = 6;
      blur = {
        enabled = true;
        size = 2;
        passes = 1;
      };

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
    };

    animations = {
      enabled = true;

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows,     1, 7,  myBezier"
        "windowsOut,  1, 7,  default, popin 80%"
        "border,      1, 10, default"
        "borderangle, 1, 8,  default"
        "fade,        1, 7,  default"
        "workspaces,  1, 6,  default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      new_status = "master";
    };

    gestures = {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      workspace_swipe = false;
    };
  };
}