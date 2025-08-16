{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./modules/nixos/bundle.nix
  ];

  networking = {
    hostName = "workmachine";
    extraHosts = ''
      10.50.70.31 hss-lab
      10.85.56.4 hss-crt-apl
      10.85.56.5 hss-crt-db
      10.209.142.4 hss-prod-bsa-apl
      10.209.142.5 hss-prod-bsa-db
      10.209.142.132 hss-prod-spo-apl
      10.209.142.133 hss-prod-spo-db
      10.20.150.100 sms-lab-adge
      10.20.150.110 sms-lab-smsc
    '';
  };

  time.timeZone = "America/Sao_Paulo";

  # services.printing.enable = true;

  services.libinput.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;

    users.pedroma = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "networkmanager"
        "docker"
        "adbusers"
        "wireshark"
        "podman"
      ];
    };
  };

  # virtualisation.waydroid.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    users = {
      "pedroma" = import ./home.nix;
    };
    backupFileExtension = "bkp";
  };

  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;

  system.stateVersion = "24.11";
}
