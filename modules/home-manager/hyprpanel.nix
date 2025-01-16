{ inputs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    theme = "one_dark";

    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" "ram" "cpu" ];
          middle = [ "media" ];
          right = [ "battery" "network" "volume" "clock" "systray" "notifications" ];
        };
      };
    };

    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = false;

      theme.bar.transparent = true;
      theme.bar.margin_sides = "8px";
      theme.bar.margin_top = "8px";

      theme.font = {
        size = "12px";
      };
    };
  };
}
