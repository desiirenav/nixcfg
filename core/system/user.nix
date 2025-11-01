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
        openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMaQy3nCSXbTg2d9rM/dBL6I40AOBBGug2bopRlfxkIE narayan@nixos"];
      };
    };
  };
}
