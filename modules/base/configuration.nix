{ inputs, pkgs, self, ... }: let inherit (self) theme; in {

  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules = [
      self.nixosModules.driver
      self.nixosModules.fonts
      self.nixosModules.gtk
      self.nixosModules.yazi
      self.nixosModules.zen-browser
      self.nixosModules.discord
      self.nixosModules.hjem
      self.nixosModules.config
      self.nixosModules.gaming
      self.nixosModules.hardware
      self.nixosModules.impermanence
      self.nixosModules.pkgs
      self.nixosModules.xinitrc
    ];
  };

  flake.nixosModules.config = { config, pkgs, ... }: {

    # Systemd-boot EFI boot loader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # ZFS & NTFS support
    boot.initrd.supportedFilesystems = [ "zfs" ];
    boot.supportedFilesystems = ["ntfs"];

    # Firewall — Weylus ports
    networking.firewall = {
      allowedTCPPorts = [ 1701 9001 ];
    };

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

    # Weylus — uinput access for tablet input
    boot.kernelModules = [ "uinput" ];
    users.groups.uinput = {};
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

    # User account
    users = {
      mutableUsers = false;
      users = {
        root.hashedPasswordFile = "/persist/passwords/root";
        narayan = {
          isNormalUser = true;
          description = "Narayan";
          extraGroups = [ "wheel" "networkmanager" "uinput" ]; # added uinput
          hashedPasswordFile = "/persist/passwords/narayan";
          shell = self.packages."${pkgs.stdenv.hostPlatform.system}".fish-wrapper;
          openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQHO6fAxv7YY1W9MsIMiY+bzwz3wJ70doC9s/ndLfv9 narayan@nixos"];
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
