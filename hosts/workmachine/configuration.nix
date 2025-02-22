{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./modules/nixos/bundle.nix
  ];

  networking.hostName = "workmachine"; # Define your hostname.

  time.timeZone = "America/Sao_Paulo";

  # services.printing.enable = true;

  services.libinput.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;

    users.pedroma = {
      isNormalUser = true;
      extraGroups = ["wheel" "input" "networkmanager" "docker" "adbusers" "wireshark" "podman"];
    };
  };

  # virtualisation.waydroid.enable = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs pkgs;};
    users = {
      "pedroma" = import ./home.nix;
    };
    backupFileExtension = "bkp";
  };

  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;

  system.stateVersion = "24.11";
}
