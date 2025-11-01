{
  description = "nix config with flake, hm and impermanence";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
    };
  
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    ignis = {
      url = "github:ignis-sh/ignis";
      inputs.nixpkgs.follows = "nixpkgs";  # recommended
    };

#    mango = {
#      url = "github:DreamMaoMao/mango";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };

    mnw = {
      url = "github:Gerg-L/mnw";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./core/configuration.nix
          inputs.disko.nixosModules.disko
          inputs.mnw.nixosModules.default
#          inputs.mango.nixosModules.mango
          inputs.hjem.nixosModules.default
          inputs.aagl.nixosModules.default 
          inputs.impermanence.nixosModules.impermanence
        ];
      };
    };
  };
}
