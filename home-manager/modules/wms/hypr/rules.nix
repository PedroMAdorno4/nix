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
  };
}
