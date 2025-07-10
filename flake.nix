{
  description = "I hope I never have to edit this again";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    disko,
    stylix,
    ...
  } @ inputs: let
    inherit (self) outputs;

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    pkgs-unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    specialArgs = {inherit inputs outputs pkgs-unstable;};
    extraSpecialArgs = {inherit inputs outputs pkgs-unstable;};
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/nixos/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      litre1 = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/litre1/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      apple = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/apple/configuration.nix
          stylix.nixosModules.stylix
        ];
      };

      vm = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/vm/configuration.nix
          disko.nixosModules.disko
        ];
      };
    };

    homeConfigurations = {
      "kleanzy@main" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        inherit extraSpecialArgs;
        modules = [
          ./home/main.nix
        ];
      };

      "kleanzy@server" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        inherit extraSpecialArgs;
        modules = [
          ./home/server.nix
        ];
      };
    };
  };
}
