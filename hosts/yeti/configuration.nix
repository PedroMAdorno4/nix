{ pkgs
, inputs
, config
, lib
, ...
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
      extraGroups = [ "wheel" "input" "networkmanager" "adbusers" "docker" "ydotool" "podman" "gamemode" "libvirtd" ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    users = {
      "quatro" = import ./home.nix;
    };
    backupFileExtension = "bkp";
  };

  services.gnome.gnome-keyring.enable = true;

  services.greetd =
    let
      niri-config = pkgs.writeText "niri-config" ''
        hotkey-overlay {
            skip-at-startup
        }
        environment {
            GTK_USE_PORTAL "0"
            GDK_DEBUG "no-portals"
        }

        // other settings

        spawn-at-startup "sh" "-c" "${pkgs.greetd.regreet}/bin/regreet; pkill -f niri"
      '';
    in
    {
      enable = true;
      settings = {
        default_session = {
          command = "niri -c ${niri-config}";
          user = "greeter";
        };
      };
    };
  programs.regreet.enable = true;

  virtualisation.waydroid.enable = true;
  services.wivrn = {
    enable = true;
    defaultRuntime = true;

  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  system.stateVersion = "24.11";
}
