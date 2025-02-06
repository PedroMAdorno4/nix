{
  services.resolved.enable = false;
  networking = {
    useNetworkd = true;
    useDHCP = false;
    firewall.enable = false;
    networkmanager.enable = true;
    wireless.enable = false;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };
}
