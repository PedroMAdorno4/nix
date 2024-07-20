{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./opts.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins/bundle.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    #colorschemes.oxocarbon.enable = true;
  };

}
