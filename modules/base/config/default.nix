{pkgs,...}:{
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

  users = {
    mutableUsers = false;
    users = {
      root.hashedPasswordFile = "/persist/passwords/root";
      narayan = {
        isNormalUser = true;
        description = "Narayan";
        extraGroups = [ "wheel" "networkmanager"];
        hashedPasswordFile = "/persist/passwords/narayan";
        openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH4YkpHGT37t14lNmHd8fsKRPKejN1JsSTjUuagC2PnA narayan@nixos"];
      };
    };
  };

  services = {
    gvfs.enable = true;
    upower.enable = true;
    openssh.enable = true;
	 gnome.core-apps.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

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

