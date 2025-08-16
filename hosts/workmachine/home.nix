{config, ...}: {
  home = {
    username = "pedroma";
    homeDirectory = "/home/pedroma";
    musicPlayerMpris = "YoutubeMusic";
    musicPlayerExecutable = "youtube-music";

    sessionVariables = {
      NH_FLAKE = "/home/pedroma/nix";
      mainMonitorName = "eDP-1";
      mainMonitorResolution = "1920x1080@60.06";
      mainMonitorPosition = "0x0";
      mainMonitorScale = "1.25";
      mainMonitor = "${config.home.sessionVariables.mainMonitorName},${config.home.sessionVariables.mainMonitorResolution},${config.home.sessionVariables.mainMonitorPosition},${config.home.sessionVariables.mainMonitorScale}";
      secondaryMonitorName = "HDMI-A-1";
      secondaryMonitorResolution = "1920x1080@59.99700";
      secondaryMonitorPosition = "1536x0";
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
