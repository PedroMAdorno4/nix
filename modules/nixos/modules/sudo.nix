{ pkgs, ... }: {
  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "${pkgs.systemd}/bin/systemctl";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.systemd}/bin/reboot";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.systemd}/bin/poweroff";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.systemd}/bin/systemd-run";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.nh}/bin/nh";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.nixos-rebuild}/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
    extraConfig = with pkgs; ''
      Defaults:quatro secure_path="${lib.makeBinPath [
        systemd
      ]}:${lib.makeBinPath [
        nh
      ]}:${lib.makeBinPath [
        nixos-rebuild
      ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
    '';
  };
}
