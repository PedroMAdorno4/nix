{
  description = "NixOS config";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    unstable-pkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/nur";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lan-mouse.url = "github:feschber/lan-mouse";
  };

  outputs = { nixpkgs, ... }@inputs:

    let
      system = "x86_64-linux";
      nixpkgsConfig = {
        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [
          inputs.nur.overlays.default
          inputs.hyprpanel.overlay
          (final: prev: {
            bibata-hyprcursor = final.callPackage ./modules/packages/bibata-hyprcursor/default.nix { baseColor = "#FFFFFF"; outlineColor = "#000000"; watchBackgroundColor = "#FFFFFF"; };
          })
        ];
      };
      unstable-pkgs = import inputs.unstable-pkgs {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {

      # yeti - system hostname
      nixosConfigurations = {
        yeti = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs unstable-pkgs;
          };
          modules = [
            ./hosts/yeti/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }
            nixpkgsConfig
          ];
        };
        workmachine = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs unstable-pkgs;
          };

          modules = [
            ./hosts/workmachine/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }
            nixpkgsConfig
          ];
        };
      };

      # devShells.${system}.default = (import ./nixos/shell.nix { inherit pkgs; });

    };
}
