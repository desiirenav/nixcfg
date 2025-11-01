{ config, lib,pkgs,inputs,system,...}: 

{

  boot = {
    initrd.supportedFilesystems = [ "zfs" ];
    supportedFilesystems = ["ntfs"];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  hardware.bluetooth.enable = true;

  networking = {
    hostName = "nixos";
    hostId = "b5bf67d7";
    networkmanager.enable = true;
  };

  time.timeZone = "Canada/Eastern";

  system.stateVersion = "25.11";
}
