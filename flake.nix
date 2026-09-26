{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pwndbg = {
      url = "github:pwndbg/pwndbg";
    };
    curseforge = {
      url = "github:spitfire05/curseforge-appimage-nix/6682c2df0e02c7a4989dc8ba3635358fb695c136";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    lib = inputs.nixpkgs.lib;
    hosts = builtins.filter (x: x != null) (
      lib.mapAttrsToList (name: value:
        if (value == "directory")
        then name
        else null) (
        builtins.readDir ./hosts
      )
    );
  in {
    nixosConfigurations = builtins.listToAttrs (
      map (
        host: {
          name = host;
          value = lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
              {config.networking.hostName = host;}
              (./hosts + "/${host}")
              ({pkgs, ...}: {
                nixpkgs.overlays = [inputs.rust-overlay.overlays.default];
                environment.systemPackages = [pkgs.rust-bin.stable.latest.default];
              })
              inputs.home-manager.nixosModules.default
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {inherit inputs;};
                  users.epg1213 = ./home/epg1213;
                  users.nezumizoe = ./home/nezumizoe;
                };
              }
            ];
          };
        }
      )
      hosts
    );
  };
}
