{ config, lib,pkgs,inputs,system,...}: 

{
  services = {
    gvfs.enable = true;
    upower.enable = true;
#    displayManager.gdm.enable = true;
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
