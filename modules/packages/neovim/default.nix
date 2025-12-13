{ pkgs, inputs, config, ... }:

{  
  environment.systemPackages = with pkgs; [
    (callPackage ./config {})
  ];
}

