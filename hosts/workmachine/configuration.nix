{ pkgs, inputs, ... }:
{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ./modules/nixos/bundle.nix
    ];

  networking.hostName = "workmachine"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "America/Sao_Paulo";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  programs.zsh.enable = true;
  # services.printing.enable = true;

  services.libinput.enable = true;
  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;

    users.pedroma = {
      isNormalUser = true;
      extraGroups = [ "wheel" "input" "networkmanager" "adbusers" "quatro" ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    users = {
      "pedroma" = import ./home.nix;
    };
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      userland-proxy = false;
      experimental = true;
      ipv6 = true;
      fixed-cidr-v6 = "fd00::/80";
    };
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprlock = {
    enable = true;
  };

  programs.adb.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

}

