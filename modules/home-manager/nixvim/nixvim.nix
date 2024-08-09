{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./opts.nix
    ./keymaps.nix
    ./autocmds.nix
    ./performance.nix
    ./plugins/bundle.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };

}
