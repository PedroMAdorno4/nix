{ inputs, pkgs, ...} : {
  imports = [
  ./modules/bundle.nix
  ];

  home = {
    username = "quatro";
    homeDirectory = "/home/quatro";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
