{pkgs, ...}: {
  services.printing = {
    enable = true;
    # drivers = with pkgs; [gutenprint canon-cups-ufr2 cups-filters epson-escpr epson-escpr2 epsonscan2];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
