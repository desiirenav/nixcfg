{self,...}:{
  perSystem {pkgs, self', ...}:{
    packages.kitty = pkgs.callPackages ./kitty {}
  }
}
