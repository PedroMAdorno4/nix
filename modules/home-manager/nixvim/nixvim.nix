{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/bundle.nix
    ./autocmds.nix
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
