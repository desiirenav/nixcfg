{inputs, pkgs, ...}: {
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
      script = "zfs rollback -r zroot/local/root@blank";
    };
  };


  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/etc/NetworkManager/system-connections"
    ];
    users.narayan = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        "Projects"
        ".ssh"
	".mozilla"
	"nixcfg"
        ".config/discord"
	".config/vesktop"
      ];
      files = [
        ".bash_history"
        ".config/systemsettingsrc" 
      ];
    };
  };
}
