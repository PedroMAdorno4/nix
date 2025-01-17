{ inputs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    config.enable = true;
    overwrite.enable = true;
    theme = "one_dark";

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "workspaces" "ram" "cpu" ];
          middle = [ "media" ];
          right = [ "battery" "network" "volume" "clock" "systray" "notifications" ];
        };
      };
    };

    settings = {
      bar = {
        launcher.autoDetectIcon = true;
        workspaces.show_icons = true;
        clock.format = "%a %d/%m  %H:%M:%S";
      };
      scalingPriority = "hyprland";
      theme.bar.floating = false;
      theme.bar.outer_spacing = "4px";
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
          weather.unit = "metric";
        };
        power.lowBatteryNotification = true;
        volume.raiseMaximumVolume = true;
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = false;
      theme.bar.transparent = true;
      theme.font.size = "12px";
    };
  };
}
