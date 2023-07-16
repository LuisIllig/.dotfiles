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
      ../modules/environments/wayland/hyprland
    ] ++ [
      ../modules/fonts
    ] ++ [
      inputs.home-manager.nixosModules.home-manager
      inputs.hyprland.nixosModules.default
      inputs.nur.nixosModules.nur
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          backupFileExtension = "backup";
          users.${user} = {
            imports = [
              (import ./laptop/home.nix)
            ] ++ [
              inputs.hyprland.homeManagerModules.default
            ];
          };
        };
      }
    ];
  };  
}
