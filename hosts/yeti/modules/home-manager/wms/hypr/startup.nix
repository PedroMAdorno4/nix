{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wl-gammarelay-rs"
      "hyprpanel"
      "fcitx5 -d -r"
      "fcitx5-remote -r"
      "[workspace 1 silent] zen"
      "[workspace 20 silent] ${config.home.musicPlayerExecutable}"
      ''mpvpaper -o "no-audio --loop-file=100 --reset-on-next-file=loop-file --loop-playlist shuffle --profile=fast" DP-3 ${config.home.homeDirectory}/videos/wallpapers/landscape/''
      ''mpvpaper -o "input-ipc-server=/tmp/mpv-socket no-audio --loop-file=100 --reset-on-next-file=loop-file --loop-playlist shuffle --profile=fast" HDMI-A-1 ${config.home.homeDirectory}/videos/wallpapers/landscape/''
      "[workspace special:term] kitty --class special-term"
    ];
  };
}
