{
  home = {
    username = "quatro";
    homeDirectory = "/home/quatro";
    stateVersion = "23.11";
  };

  imports = [
    ./modules/bundle.nix
  ];

  programs.home-manager.enable = true;
}
