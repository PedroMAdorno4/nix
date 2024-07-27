{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    #monitor=name,resolution,position,scale

    monitor=["${config.home.sessionVariables.mainMonitor}" "${config.home.sessionVariables.secondaryMonitor}"];

    # Binding workspace to monitors
    workspace = [
      "1, monitor:DP-3, default:true"
      "2, monitor:DP-3"
      "3, monitor:DP-3"
      "4, monitor:DP-3"
      "5, monitor:DP-3"
      "6, monitor:DP-3"
      "7, monitor:DP-3"
      "8, monitor:DP-3"
      "9, monitor:DP-3"
      "10, monitor:DP-3"
      "11, monitor:HDMI-A-1, default:true"
      "12, monitor:HDMI-A-1"
      "13, monitor:HDMI-A-1"
      "14, monitor:HDMI-A-1"
      "15, monitor:HDMI-A-1"
      "16, monitor:HDMI-A-1"
      "17, monitor:HDMI-A-1"
      "18, monitor:HDMI-A-1"
      "19, monitor:HDMI-A-1"
      "20, monitor:HDMI-A-1"
    ];
  };
}
