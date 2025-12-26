{ config, pkgs, ... }:

{
  # Systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ZFS & NTFS support
  boot.initrd.supportedFilesystems = [ "zfs" ];
  boot.supportedFilesystems = ["ntfs"];

  # Host settings
  networking.hostName = "nixos";
  networking.hostId = "b5bf67d7";

  # Network
  networking.networkmanager.enable = true; 

  # Time
  time.timeZone = "Canada/Eastern";

  # Language
  i18n.defaultLocale = "en_US.UTF-8";

  # TTY settings
  console = {
    colors = with config.theme; [
      base00 base08 base0B base0A base0D base0E base0C base05
      base03 base08 base0B base0A base0D base0E base0C base07
    ];
    earlySetup = true;
  };

  # Sound
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # User account
  users = {
    mutableUsers = false;
    users = {
      root.hashedPasswordFile = "/persist/passwords/root";
      narayan = {
        isNormalUser = true;
        description = "Narayan";
        extraGroups = [ "wheel" "networkmanager"];
        hashedPasswordFile = "/persist/passwords/narayan";
        openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKUCKepniVT2Z0pBnXgg0QXMg2/D3D5aZOcZwcYH/vb7 narayan@nixos"];
      };
    };
  };

  # Openssh
  services.openssh.enable = true;

  # GVFS
  services.gvfs.enable = true;


  # Upower
  services.upower.enable = true;

  # Unfree software
  nixpkgs.config.allowUnfree = true;

  # Nix settings
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "25.11";

}
  
