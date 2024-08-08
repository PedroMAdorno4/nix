{ pkgs, ... }: {
  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "${pkgs.nh}/bin/nh";
          options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
    extraConfig = with pkgs; ''
      Defaults:quatro secure_path="${lib.makeBinPath [
        nh
      ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
      Defaults passwd_timeout=0
    '';
  };
}
