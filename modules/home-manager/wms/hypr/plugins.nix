{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.plugins = [
    inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    # inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
    #inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
  ];
}
