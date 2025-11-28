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

    wrappers.url = "github:Lassulus/wrappers";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";

    plugin-base2tone ={ 
      url = "github:atelierbram/Base2Tone-nvim";
      flake = false;
    };

    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }: 

    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./modules/dots/kitty
      ];

      flake = {
        nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs self; };
            modules = [ 
              ./modules/default.nix
              inputs.disko.nixosModules.disko
              inputs.hjem.nixosModules.default
              inputs.impermanence.nixosModules.impermanence
            ];
          };
        };
      };
    };
}
