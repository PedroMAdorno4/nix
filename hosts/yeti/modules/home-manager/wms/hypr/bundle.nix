{ inputs, pkgs, ... }: {
  imports = [
    ../../../../../../modules/home-manager/wms/hypr/plugins.nix
    ../../../../../../modules/home-manager/wms/hypr/binds.nix
    ../../../../../../modules/home-manager/wms/hypr/rules.nix
    ./settings.nix
    ./display.nix
    ./startup.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}
