{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      ''dconf write /org/gnome/desktop/interface/cursor-theme "'Bibata-Modern-Ice'"''
      "hyprctl setcursor Bibata-modern 20"
      "fcitx5"
      "ags"
      "[workspace 1 silent] firefox"
      "[workspace 20 silent] kitty ncspot"
      "[workspace 19 silent] slack"
    ];
  };
}
