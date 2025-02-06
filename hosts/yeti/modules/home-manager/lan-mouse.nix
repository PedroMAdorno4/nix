{ inputs, ... }: {
  # add the home manager module
  imports = [ inputs.lan-mouse.homeManagerModules.default ];

  programs.lan-mouse = {
    enable = true;
    systemd = true;
    # package = inputs.lan-mouse.packages.${pkgs.stdenv.hostPlatform.system}.default
    # Optional configuration in nix syntax, see config.toml for available options
    settings = {
      authorized_fingerprints = {
        "2d:a8:39:99:93:4e:13:8d:af:b2:50:06:bd:75:5d:1d:63:ab:d2:0f:48:03:c8:66:60:59:65:31:ac:2d:df:42" = "workmachine";
      };
      left = {
        hostname = "workmachine";
        ips = [ "192.168.1.4" ];
      };
    };
  };
}
