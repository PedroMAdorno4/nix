{ pkgs, ... }: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    image = ../../../wallpaper.webp;

    targets.nixvim.enable = true;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    fonts = {
      monospace = {
        #package = pkgs.nerdFonts.override { fonts = ["JetBrainsMono"]; };
        #name = "JetBrainsMono Nerd Font Mono";
        package = pkgs.ibm-plex;
        name = "IBM Plex Mono";
      };
      sansSerif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Sans";
      };
      serif = {
        package = pkgs.ibm-plex;
        name = "IBM Plex Serif";
      };

      sizes = {
        applications = 11;
        desktop = 9;
        popups = 14;
        terminal = 9;
      };
    };

    opacity = {
      terminal = 0.90;
      desktop = 0.00;
      popups = 1.00;
      applications = 1.00;
    };


  };
}
