{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Brave
      "float,title:^(Picture in picture)$"
      "pin,title:^(Picture in picture)$"
      "size 560 315,title:^(Picture in picture)$"
      "move 100%-w-10 100%-w-10,title:^(Picture in picture)$"
      # Opens brave windows on their workspaces. To set the title, Right-click title bar > Name window...
      "workspace 1 silent, class:^(brave-browser)$, title:^(Brave: Main)$"
      "workspace 11 silent, class:^(brave-browser)$, title:^(Brave: Secondary)$"

      # Firefox
      "float,title:^(Picture-in-Picture)$"
      "pin,title:^(Picture-in-Picture)$"
      "size 560 315,title:^(Picture-in-Picture)$"
      "move 100%-w-10 100%-w-10,title:^(Picture-in-Picture)$"

      # Transmission-GTK 
      "float,title:^(Torrent Options)$"
      "workspace 5 silent, class:^(transmission-gtk)$, title:^(Transmission)$"

      # Waydroid
      "workspace 18 silent, class:^(Waydroid)$, title:^(Waydroid)$"
      "float, class:^(Waydroid)$, title:^(Waydroid)$"
      "size 475 770, class:^(Waydroid)$, title:^(Waydroid)$"
    ];
  };
}
