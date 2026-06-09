{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
  };
}
