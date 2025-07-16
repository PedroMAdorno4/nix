{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./modules/nixos/bundle.nix
  ];

  networking.hostName = "yeti"; # Define your hostname.

  time.timeZone = "America/Sao_Paulo";

  # services.printing.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.quatro = {
      isNormalUser = true;
      extraGroups = ["wheel" "input" "networkmanager" "adbusers" "docker" "ydotool" "podman" "gamemode" "libvirtd"];
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs pkgs;};
    users = {
      "quatro" = import ./home.nix;
    };
    backupFileExtension = "bkp";
  };

  services.gnome.gnome-keyring.enable = true;
  virtualisation.waydroid.enable = true;

  system.stateVersion = "24.11";
}
