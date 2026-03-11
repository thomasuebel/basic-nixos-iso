{
  description = "NixOS ISO builder";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.iso = lib.nixosSystem {
        inherit system;
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./modules/hetzner-hardware.nix
          ./modules/ssh.nix
          ./modules/system.nix
        ];
      };

      packages.${system} = let
        iso = self.nixosConfigurations.iso.config.system.build.isoImage;
      in {
        inherit iso;
        default = iso;
      };
    };
}
