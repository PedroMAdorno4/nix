{ inputs, pkgs, ...}: {
  imports = [
    ./brave.nix
    ./wofi.nix
    ./wms/hypr/hyprland.nix
    ./wms/waybar.nix
    ./hyprlock.nix
  ];
}
