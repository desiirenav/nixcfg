{ inputs, ...}: {
  flake.nixosModules.impermanence = {pkgs, ... }: {
    imports = [
      inputs.impermanence.nixosModules.impermanence
    ];

    programs.fuse.userAllowOther = true;

    boot.initrd.systemd = {
      enable = true;
      services.initrd-rollback-root = {
        after = [ "zfs-import-zroot.service" ];
        wantedBy = [ "initrd.target" ];
        before = [
          "sysroot.mount"
        ];
        path = [ pkgs.zfs ];
        description = "Rollback root fs";
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = "zfs rollback -r zroot/root@blank";
      };
    };

    environment.persistence."/persist" = {
      hideMounts = true;
      directories = [
        "/etc/nixos"
        "/var/lib/bluetooth"
        "/var/lib/nixos"
        "/etc/NetworkManager/system-connections"
      ];
      users.narayan = {
        directories = [
          ".zen"
          ".ssh"
          "Games"
          "Music"
          "nixcfg"
          ".steam"
          "Videos"
          "Projects"
          "Pictures"
          "Downloads"
          "Documents"
          ".config/discord"
          ".config/Vencord"
          ".local/share/fish"
          ".local/share/Steam"
        ];
        files = [
          ".bash_history"
          ".config/systemsettingsrc" 
        ];
      };
    };
   
  };
}

