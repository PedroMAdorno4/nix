{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    #monitor=name,resolution,position,scale

    monitor=["${config.home.sessionVariables.mainMonitor}" "${config.home.sessionVariables.secondaryMonitor}"];

    # Binding workspace to monitors
    #workspace = ["1, monitor:DP-3, default:true" "2, monitor:DP-3" "3, monitor:DP-3" "4, monitor:DP-3" "5, monitor:DP-3" "6, monitor:DP-3" "7, monitor:DP-3" "8, monitor:DP-3" "9, monitor:DP-3" "10, monitor:DP-3" "101, monitor:HDMI-A-1, default:true" "102, monitor:HDMI-A-1" "103, monitor:HDMI-A-1" "104, monitor:HDMI-A-1" "105, monitor:HDMI-A-1" "106, monitor:HDMI-A-1" "107, monitor:HDMI-A-1" "108, monitor:HDMI-A-1" "109, monitor:HDMI-A-1" "110, monitor:HDMI-A-1"];
  };
}
