{ pkgs, inputs, config, ... }:

{
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          base2tone-nvim = prev.vimUtils.buildVimPlugin {
            name = "base2tone-nvim";
            src = inputs.base2tone-nvim;
          };
        };
      })
    ];
  };

  environment.systemPackages = with pkgs; [
    (callPackage ./config {})
  ];
}

