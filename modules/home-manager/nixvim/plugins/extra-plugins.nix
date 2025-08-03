{pkgs, ...}: {
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.supermaven-nvim
  ];
}
