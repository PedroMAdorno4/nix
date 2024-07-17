{
  imports = [
    ./opts.nix
    ./plugins/plugins-bundle.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.oxocarbon.enable = true;
  };

}
