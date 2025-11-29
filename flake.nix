{
  description = "nixos config with flake, hjem and impermanence";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ignis = {
      url = "github:ignis-sh/ignis";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    mnw = { 
      url = "github:Gerg-L/mnw";
    };

    plugin-base2tone ={ 
      url = "github:atelierbram/Base2Tone-nvim";
      flake = false;
    };

    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    wrappers = { 
      url = "github:Lassulus/wrappers";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-parts,... }: 
    flake-parts.lib.mkFlake {inherit inputs; } (top@{ config, withSystem, moduleWithSystem, ... }: {
      imports = [
        ./packages
      ];
      flake = {
        nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    specialArgs = { inherit inputs; };
	    modules = [
	      ./modules/default.nix
	      inputs.disko.nixosModules.disko
	      inputs.hjem.nixosModules.default
              inputs.impermanence.nixosModules.impermanence
	    ];
	  };
        };
      };
      systems = [
        "x86_64-linux"
      ];
   });
}
