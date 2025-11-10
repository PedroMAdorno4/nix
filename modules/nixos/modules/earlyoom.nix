{
  services.earlyoom = {
    enable = true;
    freeSwapThreshold = 5;
    freeMemThreshold = 5;
    extraArgs = [
      "-g"
      "--prefer '^(electron|firefox|chromium)$'"
    ];
  };
}
