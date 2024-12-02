{ pkgs, ... }:
{
  programs.nixvim.plugins.chadtree = {
    enable = true;
    package = pkgs.vimPlugins.chadtree;
  };
}
