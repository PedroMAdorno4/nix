{
  description = "NixOS config";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://devenv.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
  };

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    unstable-pkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable-pkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # hyprland.url = "github:hyprwm/Hyprland/v0.45.2";
    hyprland.url = "github:hyprwm/Hyprland";

    #    hyprland-plugins = {
    #      url = "github:hyprwm/hyprland-plugins";
    #      inputs.hyprland.follows = "hyprland";
    #    };

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      # url = "github:Duckonaut/split-monitor-workspaces";
      # url = "git+file:///home/pedroma/pjx/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      # url = "github:nix-community/home-manager?ref=release-24.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      # url = "github:nix-community/nixvim?ref=nixos-24.11";
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      # url = "github:danth/stylix?ref=release-24.11";
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # stylix.url = "git+file:/home/quatro/pjx/stylix";

    nur.url = "github:nix-community/nur";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      hueForgeAppImagePath = ./modules/packages/binaries/HueForge_v0.9.1.2-test.AppImage;
      nixpkgsConfig = {
        nixpkgs.config = {
          allowUnfree = true;
          permittedInsecurePackages = [
          ];
        };
        nixpkgs.overlays = [
          inputs.nur.overlays.default
          inputs.niri.overlays.niri
          (final: prev: {
            bibata-hyprcursor = final.callPackage ./modules/packages/bibata-hyprcursor/default.nix {
              baseColor = "#FFFFFF";
              outlineColor = "#000000";
              watchBackgroundColor = "#FFFFFF";
            };
            hueforge =
              if builtins.pathExists hueForgeAppImagePath then
                prev.callPackage ./modules/packages/hueforge.nix
                  {
                    appImageSrc = builtins.path {
                      path = hueForgeAppImagePath;
                      name = "HueForge.AppImage";
                    };
                  }
              else
                prev.writeShellScriptBin "HueForge" ''
                  echo "HueForge AppImage not found at: ${hueForgeAppImagePath}"
                  echo "Please download the AppImage and place it at the expected location."
                  exit 1
                '';
          })
        ];
      };
      unstable-pkgs = import inputs.unstable-pkgs {
        inherit system;
        config.allowUnfree = true;
      };
      stable-pkgs = import inputs.stable-pkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # yeti - system hostname
      nixosConfigurations = {
        yeti = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs unstable-pkgs stable-pkgs;
          };
          modules = [
            ./hosts/yeti/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.nix-index
            inputs.niri.nixosModules.niri
            { programs.nix-index-database.comma.enable = true; }
            nixpkgsConfig
          ];
        };
        workmachine = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs unstable-pkgs stable-pkgs;
          };

          modules = [
            ./hosts/workmachine/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.nix-index
            inputs.niri.nixosModules.niri
            { programs.nix-index-database.comma.enable = true; }
            nixpkgsConfig
          ];
        };
      };

      # devShells.${system}.default = (import ./nixos/shell.nix { inherit pkgs; });
    };
}
