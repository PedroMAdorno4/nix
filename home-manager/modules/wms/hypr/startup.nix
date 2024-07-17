{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "gsettings set org.gnome.desktop.interface color-scheme prefer-dark"
      "hyprctl setcursor Bibata-Modern-Classic 20"
      "~/.config/hypr/xdg-portal-hyprland"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      "waybar"
      ''mpvpaper -o "no-audio --loop-file=100 --reset-on-next-file=loop-file --loop-playlist shuffle" DP-3 ~/Videos/wallpapers/landscape/''
      ''mpvpaper -o "no-audio --loop-file=100 --reset-on-next-file=loop-file --loop-playlist shuffle" HDMI-A-1 ~/Videos/wallpapers/landscape/''
    ];
  };
}
