{ config, lib,pkgs,inputs,system,...}: 

{ 

  users = {
    mutableUsers = false;
    users = {
      root.hashedPasswordFile = "/persist/passwords/root";
      narayan = {
        isNormalUser = true;
        description = "Narayan";
        extraGroups = [ "wheel" "networkmanager"];
        hashedPasswordFile = "/persist/passwords/narayan";
        openssh.authorizedKeys.keys = ["sh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAY8RGLYYV/3VmoKhHa/HfAUjHbL0MoYhvTfHLu9yIgI narayan@nixos"];
      };
    };
  };
}
