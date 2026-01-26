{
  description = "NixOS config with flake, wrappers and impermanence";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
    };

    base2tone-nvim = {
      url = "github:atelierbram/Base2Tone-nvim";
      flake = false;
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    wrappers = {
      url = "github:lassulus/wrappers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        ./modules
	    inputs.impermanence.nixosModules.impermanence
      ];
    };
  };
}
