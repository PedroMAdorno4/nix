{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float,class:^(org.kde.ark)$"
      "opacity 0.8 0.8,class:^(kitty)$"
      "opacity 0.8 0.8,class:^(thunar)$"
      "float,title:^(Picture in picture)$"
      "noinitialfocus,class:^jetbrains-(?!toolbox),floating:1"
      "float,title:^(Torrent Options)$"
    ];

    windowrulev2 = [
      "workspace 1 silent, class:^(brave-browser)$, title:^(Brave: Main)$"
      "workspace 11 silent, class:^(brave-browser)$, title:^(Brave: Secondary)$"
    ];
  };
}
