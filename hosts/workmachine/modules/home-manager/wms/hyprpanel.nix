{inputs, ...}: {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

  programs.hyprpanel = {
    enable = true;
    config.enable = true;
    overwrite.enable = true;
    theme = "one_dark";

    layout = {
      "bar.layouts" = {
        "0" = {
          left = ["workspaces" "ram" "cpu"];
          middle = ["media"];
          right = ["battery" "network" "volume" "clock" "systray" "notifications"];
        };
      };
    };

    settings = {
      bar = {
        launcher.autoDetectIcon = true;
        workspaces.show_icons = false;
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
      menus.dashboard.stats.enable_gpu = false;
      theme.bar.transparent = true;
      theme.font.size = "12px";
      theme.bar.floating = false;
      theme.bar.outer_spacing = "4px";
      theme.bar.layer = "bottom";
    };
  };
}
