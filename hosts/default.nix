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
      ../modules/environments/wayland/sway
    ] ++ [
      ../modules/fonts
    ] ++ [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          backupFileExtension = "backup";
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
