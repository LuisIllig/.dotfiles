{
  description = "My NixOS flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { self, nixpkgs, ... }:
  let
    user = "shyiyn";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { 
        allowUnfree = true; 
        # permittedInsecurePackages = ["electron-25.9.0"];
      };
      overlays = [
        inputs.nur.overlay
      ];
    };
  in 
  {
    nixosConfigurations = (
      import ./hosts {
        inherit self pkgs nixpkgs system inputs user;
      }
    );
  };
}
