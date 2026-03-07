{
  flake.nixosModules.hardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =
      [ (modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "zroot/root";
        fsType = "zfs";
        neededForBoot = true;
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-label/NIXBOOT";
        fsType = "vfat";
        options = [ "umask=0077" ];
      };

    fileSystems."/nix" =
      { device = "zroot/nix";
        fsType = "zfs";
      };

    fileSystems."/persist" =
      { device = "zroot/persist";
        fsType = "zfs";
        neededForBoot = true;
      };

    swapDevices = [ { device = "/dev/disk/by-label/SWAP"; } ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

