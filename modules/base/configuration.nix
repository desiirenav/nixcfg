{ inputs, pkgs, self, ... }: let inherit (self) theme; in {

  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules = [
      self.nixosModules.driver
      self.nixosModules.fonts
      self.nixosModules.gtk
      self.nixosModules.zen-browser
      self.nixosModules.discord
      self.nixosModules.hjem
      self.nixosModules.config
      self.nixosModules.gaming
      self.nixosModules.hardware
      self.nixosModules.impermanence
      self.nixosModules.pkgs
    ];
  };

  flake.nixosModules.config = { config, pkgs, ... }: {

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
      colors = with theme; [
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
          shell = self.packages."${pkgs.stdenv.hostPlatform.system}".fish-wrapper;
          openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIONQoQIS8ZEFvfsbH7H5IBYiEbSxWnhRTWL/WEAwzF5s narayan@nixos"];
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

  };

}
