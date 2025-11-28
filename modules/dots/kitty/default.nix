{self, ...}: {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    packages.terminal = self'.packages.kitty;

    packages.kitty = self.inputs.wrappers.wrapperModules.kitty.apply {
      inherit pkgs;
      config = {
        font_size = 15;
      };
    };
  };
}
