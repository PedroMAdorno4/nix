{config, ...}: {
  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/nix";
  };
}
