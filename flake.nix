{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.blueteeth = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        # shared between both machines
        ./configuration.nix

        # device-specific
        ./hosts/blueteeth/settings.nix
        ./hosts/blueteeth/hardware.nix
      ];
    };
    
    nixosConfigurations.blueeye = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        # shared between both machines
        ./configuration.nix

        # device-specific
        ./hosts/blueeye/settings.nix
        ./hosts/blueeye/hardware.nix
      ];
    };
  };
}
