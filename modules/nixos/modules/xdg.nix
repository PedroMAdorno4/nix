{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-wlr];
      configPackages = with pkgs; [
        xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-wlr
      ];
    };
  };
}
