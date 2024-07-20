{ inputs, pkgs, ...}: {
  imports = [
    ./nixvim/nixvim.nix
    ./wms/hypr/hyprland.nix
    ./wms/waybar.nix
    ./brave.nix
    ./env.nix
    ./git.nix
    ./hyprlock.nix
    ./kitty.nix
    ./mpv.nix
    ./ncspot.nix
    ./theme.nix
    ./wofi.nix
    ./zathura.nix
  ];
}
