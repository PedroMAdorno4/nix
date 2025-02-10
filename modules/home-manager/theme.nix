{pkgs, ...}: {
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.numix-icon-theme;
      name = "numix-icon-theme";
    };
  };
}
