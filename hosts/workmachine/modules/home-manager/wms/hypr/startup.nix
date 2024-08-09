{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      ''dconf write /org/gnome/desktop/interface/cursor-theme "'Bibata-Modern-Ice'"''
      "hyprctl setcursor Bibata-modern 20"
      # "waybar"
    ];
  };
}
