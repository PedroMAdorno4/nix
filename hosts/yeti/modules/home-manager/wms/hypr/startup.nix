{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags"
      ''dconf write /org/gnome/desktop/interface/cursor-theme "'Bibata-Modern-Ice'"''
      "hyprctl setcursor Bibata-modern 20"
      "fcitx5 -d -r"
      "fcitx5-remote -r"
      "[workspace 1 silent] firefox"
      "[workspace 20 silent] kitty ncspot"
      ''mpvpaper -o "no-audio --loop-file=100 --reset-on-next-file=loop-file --loop-playlist shuffle --profile=fast" DP-3 ${config.home.homeDirectory}/videos/wallpapers/landscape/''
      ''mpvpaper -o "input-ipc-server=/tmp/mpv-socket no-audio --loop-file=100 --reset-on-next-file=loop-file --loop-playlist shuffle --profile=fast" HDMI-A-1 ${config.home.homeDirectory}/videos/wallpapers/landscape/''
    ];
  };
}
