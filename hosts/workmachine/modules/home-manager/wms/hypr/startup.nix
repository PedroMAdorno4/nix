{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags"
      ''dconf write /org/gnome/desktop/interface/cursor-theme "'Bibata-Modern-Ice'"''
      "hyprctl setcursor Bibata-modern 20"
      "fcitx5 -d -r"
      "fcitx5-remote -r"
      "ags"
      "[workspace 11 silent] firefox"
      "[workspace 10 silent] kitty ncspot"
      "[workspace 9 silent] slack"
    ];
  };
}
