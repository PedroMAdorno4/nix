{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wl-gammarelay-rs"
      "pypr"
      "hyprpanel"
      "fcitx5 -d -r"
      "fcitx5-remote -r"
      "[workspace 1 silent] firefox"
      "[workspace 10 silent] kitty ncspot"
      "[workspace 9 silent] sleep 10; slack"
    ];
  };
}
