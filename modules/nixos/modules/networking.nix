{
  networking.hostName = "workmachine"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  services.resolved.enable = false;
}
