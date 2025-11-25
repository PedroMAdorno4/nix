{ pkgs, ... }: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        pkgs.xdg-desktop-portal-gtk
      ];

      configPackages = with pkgs; [
        niri-unstable
      ];

    };
  };
}
