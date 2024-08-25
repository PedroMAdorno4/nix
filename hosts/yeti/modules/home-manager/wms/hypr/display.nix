{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    #monitor=name,resolution,position,scale

    monitor = [ "${config.home.sessionVariables.mainMonitor}" "${config.home.sessionVariables.secondaryMonitor}" ];

    # Binding workspace to monitors
    workspace = [
      "1, monitor:${config.home.sessionVariables.mainMonitorName}, default:true"
      "2, monitor:${config.home.sessionVariables.mainMonitorName}"
      "3, monitor:${config.home.sessionVariables.mainMonitorName}"
      "4, monitor:${config.home.sessionVariables.mainMonitorName}"
      "5, monitor:${config.home.sessionVariables.mainMonitorName}"
      "6, monitor:${config.home.sessionVariables.mainMonitorName}"
      "7, monitor:${config.home.sessionVariables.mainMonitorName}"
      "8, monitor:${config.home.sessionVariables.mainMonitorName}"
      "9, monitor:${config.home.sessionVariables.mainMonitorName}"
      "10, monitor:${config.home.sessionVariables.mainMonitorName}"
      "11, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "12, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "13, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "14, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "15, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "16, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "17, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "18, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "19, monitor:${config.home.sessionVariables.secondaryMonitorName}"
      "20, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    ];
  };
}
