{ config, ... }: {
  wayland.windowManager.hyprland.settings = {
    #monitor=name,resolution,position,scale

    monitor = [ "${config.home.sessionVariables.mainMonitor}" "${config.home.sessionVariables.secondaryMonitor}" ];

    # Binding workspace to monitors
    # workspace = [
    #   "1, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "2, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "3, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "4, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "5, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "6, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "7, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "8, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "9, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "10, monitor:${config.home.sessionVariables.secondaryMonitorName}"
    #   "11, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "12, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "13, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "14, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "15, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "16, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "17, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "18, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "19, monitor:${config.home.sessionVariables.mainMonitorName}"
    #   "20, monitor:${config.home.sessionVariables.mainMonitorName}"
    # ];
  };
}
