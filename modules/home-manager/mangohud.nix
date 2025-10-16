{lib, ...}: {
  programs.mangohud = {
    enable = true;
    settings = lib.mkForce {
      legacy_layout = false;
      fps = true;
      fps_color_change = true;
      fps_text = "";
      frametime = false;
      toggle_hud_position = "Shift_L+F10";
      background_alpha = 0.8;
      position = "top-left";
      font_size = 14;
      fps_value = "30,60,144";
      fps_color = "b22222,fdfd09,39f900";
    };
  };
}
