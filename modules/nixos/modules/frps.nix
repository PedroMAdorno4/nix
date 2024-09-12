{
  services.frp = {
    enable = true;
    role = "client";
    settings = {
      serverAddr = "191.101.70.87";
      serverPort = 7000;
      proxies = {
        name = "web01";
        type = "http";
        localIP = "127.0.0.1";
        localPort = 8080;
      };
    };
  };


}
