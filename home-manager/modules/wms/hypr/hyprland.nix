{ inputs, pkgs, ... }: {
  imports = [
    ./binds.nix
    ./display.nix
    ./startup.nix
    ./rules.nix
    ./settings.nix
    ./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}
