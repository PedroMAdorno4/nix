{ inputs, pkgs, config, ... }: {
  imports = [
    ./plugins.nix
    ./binds.nix
    ./display.nix
    ./startup.nix
    ./rules.nix
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}
