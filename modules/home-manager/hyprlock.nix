{
  config,
  lib,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = lib.mkForce {
      general = {
        disable_loading_bar = false;
        grace = 3;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = lib.mkForce [
        {
          path = "${config.home.homeDirectory}/nix/lockscreen.jpg";
          blur_passes = 1;
          blur_size = 3;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -450";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          text_align = "center";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 25;
          font_family = "Noto Sans";
          position = "60, 60";
        }
      ];
    };
  };
}
