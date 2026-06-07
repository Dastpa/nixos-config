{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];

  environment.systemPackages = with pkgs; [
    nvidia-system-monitor
  ];
}
