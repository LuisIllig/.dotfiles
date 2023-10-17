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
      inputs.nur.hmModules.nur
      {
        nixpkgs.overlays = [
          inputs.nur.overlay
        ]; 
      }
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs user; };
          backupFileExtension = "backup";
          users.${user} = {
            imports = [
              (import ./laptop/home.nix)
            ] ++ [
              inputs.hyprland.homeManagerModules.default
              inputs.nur.hmModules.nur
              inputs.nixvim.homeManagerModules.nixvim
            ];
          };
        };
      }
    ];
  };  
}
