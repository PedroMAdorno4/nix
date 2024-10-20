{ pkgs, inputs, ... }: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = pkgs.xdg-desktop-portal-wlr;
  };

  programs.hyprlock = {
    enable = true;
  };
}
