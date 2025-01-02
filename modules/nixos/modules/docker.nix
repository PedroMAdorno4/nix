{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    autoPrune.dates = "daily";
    liveRestore = true;
    enableOnBoot = false;
    rootless = {
      enable = true;
      # setSocketVariable = true;
    };
    daemon.settings = {
      userland-proxy = false;
      experimental = true;
      metrics-addr = "0.0.0.0:9323";
      # ipv6 = true;
      # fixed-cidr-v6 = "fd00::/80";
    };
  };
}
