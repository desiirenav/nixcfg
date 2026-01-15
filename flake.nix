{
  description = "NixOS config with flake, wrappers and impermanence";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts = {
      url = "github:raxxuy/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
	inputs.aagl.nixosModules.default
	inputs.impermanence.nixosModules.impermanence
      ];
    };
  };
}
