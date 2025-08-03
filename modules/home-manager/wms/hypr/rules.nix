{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
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

      # Steam
      "float,class:^(steam)$,title:^(Friends List)$"
      "minsize 1 1,class:^(steam)$"

      # Godot
      "size 950 760,class:^(Godot)$,title:^(Create New Node)$"
      "center 1,class:^(Godot)$,title:^(Create New Node)$"

      # Bitwarden extension firefox
      "float,title:^(Extension: \(Bitwarden Password Manager\) - Bitwarden — Mozilla Firefox)$,class:^(firefox)$"
      "size 420 620,title:^(Extension: \(Bitwarden Password Manager\) - Bitwarden — Mozilla Firefox)$,class:^(firefox)$"

      # Satty screenshot tool
      "float,title:^(satty)$"
      "size 75% 75%,title:^(satty)$"
      "center 1,title:^(satty)$"

      # Kitty scratchpad
      "float,class:^(special.*)$"
      "size 50% 75%,title:^(special.*)$"
      "center 1,title:^(special.*)$"
      "animation popin,title:^(special.*)$"
    ];
  };
}
