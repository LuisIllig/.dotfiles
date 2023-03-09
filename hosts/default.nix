{ self, nixpkgs, system, inputs, user, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    configallowunfree = true;
  };

  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };

    modules = [
      ./laptop/hardware-configuration.nix
    ] ++ [
      ./system
    ] ++ [
      ./environment/plasma
    ] ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./laptop/home.nix)
            ];
          };
        };
      }
    ];
  };  
}
