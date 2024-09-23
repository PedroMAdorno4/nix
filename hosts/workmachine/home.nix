{ config, ... }: {
  home = {
    username = "pedroma";
    homeDirectory = "/home/pedroma";

    sessionVariables = {
      FLAKE = "/home/pedroma/nix";
      mainMonitorName = "eDP-1";
      mainMonitorResolution = "1920x1080@59.99700";
      mainMonitorPosition = "1920x0";
      mainMonitorScale = "1";
      mainMonitor = "${config.home.sessionVariables.mainMonitorName},${config.home.sessionVariables.mainMonitorResolution},${config.home.sessionVariables.mainMonitorPosition},${config.home.sessionVariables.mainMonitorScale}";
      secondaryMonitorName = "HDMI-A-1";
      secondaryMonitorResolution = "1920x1080@59.99700";
      secondaryMonitorPosition = "0x0";
      secondaryMonitorScale = "1";

      # this value controls what the Super + N keybind rotate the monitor to
      secondaryMonitorPortraitTransform = "1";
      secondaryMonitor = "${config.home.sessionVariables.secondaryMonitorName},${config.home.sessionVariables.secondaryMonitorResolution},${config.home.sessionVariables.secondaryMonitorPosition},${config.home.sessionVariables.secondaryMonitorScale},transform,0";
    };
    stateVersion = "23.11";
  };

  imports = [
    ./modules/home-manager/bundle.nix
  ];

  programs.home-manager.enable = true;
}
