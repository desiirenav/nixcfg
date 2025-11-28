{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    (inputs.wrappers.wrapperModules.kitty.apply {
      inherit pkgs;
      config = {
        font_size = 13;
      };
    }).wrapper
  ];
}
