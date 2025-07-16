{...}: {
  programs.hyprpanel = {
    enable = true;

    settings = {
      theme = {
        name = "one_dark";
        bar.transparent = true;
        font.size = "12px";
        bar.floating = false;
        bar.outer_spacing = "4px";
        bar.layer = "bottom";
      };

      "bar.layouts" = {
        "0" = {
          left = ["workspaces" "ram" "cpu"];
          middle = ["media"];
          right = ["network" "volume" "clock" "systray" "notifications"];
        };
        "1" = {
          left = ["workspaces" "ram" "cpu"];
          middle = ["media"];
          right = ["network" "volume" "clock" "systray" "notifications"];
        };
      };

      bar = {
        launcher.autoDetectIcon = true;
        workspaces.show_icons = false;
        workspaces.ignored = "-\\d+";
        clock.format = "%a %d/%m  %H:%M:%S";
      };

      scalingPriority = "hyprland";
      menus.media.displayTime = true;
      notifications.showActionsOnHover = true;
      # notifications.autoDismiss = true;
      wallpaper.enable = false;

      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
          weather = {
            key = "ae0ae3b5e185409d8d232634251701";
            location = "Pouso Alegre";
            unit = "metric";
          };
        };
        power.lowBatteryNotification = true;
        volume.raiseMaximumVolume = true;
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;
    };
  };
}
