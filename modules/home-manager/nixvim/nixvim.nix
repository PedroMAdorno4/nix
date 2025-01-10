{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/bundle.nix
    ./autocmds.nix
    ./colorscheme.nix
    ./extra-config.nix
    ./keymaps.nix
    ./performance.nix
    ./opts.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };

}
