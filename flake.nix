{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    #    hyprland-plugins = {
    #      url = "github:hyprwm/hyprland-plugins";
    #      inputs.hyprland.follows = "hyprland";
    #    };

    split-monitor-workspaces = {
      # url = "github:Duckonaut/split-monitor-workspaces";
      url = "git+file:/home/quatro/pjx/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    # stylix.url = "git+file:/home/quatro/pjx/stylix";

    ags.url = "github:Aylur/ags";

    nur.url = "github:nix-community/nur";
  };

  outputs = { nixpkgs, ... }@inputs:

    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [
          inputs.nur.overlay
        ];
        config = {
          allowUnfree = true;
        };
      };
    in
    {

      # yeti - system hostname
      nixosConfigurations = {
        yeti = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs pkgs; };
          modules = [
            ./hosts/yeti/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
          ];
        };
        workmachine = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs pkgs; };
          modules = [
            ./hosts/workmachine/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
          ];
        };
      };

      # devShells.${system}.default = (import ./nixos/shell.nix { inherit pkgs; });

    };
}
