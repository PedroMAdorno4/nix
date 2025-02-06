{ inputs, ... }: {
  # add the home manager module
  imports = [ inputs.lan-mouse.homeManagerModules.default ];

  programs.lan-mouse = {
    enable = true;
    # systemd = false;
    # package = inputs.lan-mouse.packages.${pkgs.stdenv.hostPlatform.system}.default
    # Optional configuration in nix syntax, see config.toml for available options
    settings = {
      authorized_fingerprints = {
        "4f:93:bd:d2:dc:cf:30:c1:b4:7e:70:00:2b:6e:db:dd:aa:f6:24:f6:80:33:db:8f:e5:5d:c6:c8:af:36:8f:13" = "yeti";
      };
    };
  };
}
