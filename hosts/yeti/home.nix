{ config, ... }: {
  home = {
    username = "quatro";
    homeDirectory = "/home/quatro";

    sessionVariables = {
      FLAKE = "/home/quatro/nix";
      mainMonitorName = "DP-3";
      mainMonitorResolution = "1920x1080@143.98100";
      mainMonitorPosition = "0x0";
      mainMonitorScale = "1";
      mainMonitor = "${config.home.sessionVariables.mainMonitorName},${config.home.sessionVariables.mainMonitorResolution},${config.home.sessionVariables.mainMonitorPosition},${config.home.sessionVariables.mainMonitorScale}";
      secondaryMonitorName = "HDMI-A-1";
      secondaryMonitorResolution = "1920x1080@60";
      secondaryMonitorPosition = "1920x0";
      secondaryMonitorScale = "1";

      # this value controls what the Super + N keybind rotate the monitor to
      secondaryMonitorPortraitTransform = "1";
      secondaryMonitor = "${config.home.sessionVariables.secondaryMonitorName},${config.home.sessionVariables.secondaryMonitorResolution},${config.home.sessionVariables.secondaryMonitorPosition},${config.home.sessionVariables.secondaryMonitorScale},transform,0";
    };
    stateVersion = "24.11";
  };

  imports = [
    ./modules/home-manager/bundle.nix
  ];

  programs.home-manager.enable = true;
}
