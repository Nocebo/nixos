{
  description = "I hope I never have to edit this again";

  inputs = {
    nixu.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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
    home-manager,
    disko,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nixos/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kleanzy = import ./home/main.nix;
          }
        ];
      };

      litre1 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/litre1/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kleanzy = import ./home/server.nix;
          }
        ];
      };

      # homeConfigurations = {
      #   "kleanzy@main" = home-manager.lib.homeManagerConfiguration {
      #     modules = [
      #       ./home/main.nix
      #     ];
      #   };

      #   "kleanzy@server" = home-manager.lib.homeManagerConfiguration {
      #     modules = [
      #       ./home/server.nix
      #     ];
      #   };
      # };
    };
  };
}
