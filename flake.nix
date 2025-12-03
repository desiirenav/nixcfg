{
  description = "nixos config with flake, hjem and impermanence";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
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

    maple-mono = {
      url = "github:subframe7536/maple-font/variable";
      flake = false;
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
  };

  outputs = inputs@{ nixpkgs, ... }: {
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
}
