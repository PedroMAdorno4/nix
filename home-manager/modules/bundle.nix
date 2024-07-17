{ inputs, pkgs, ...}: {
  imports = [
    ./brave.nix
    ./wms/hypr/hyprland.nix
    ./wms/waybar.nix
  ];
}
