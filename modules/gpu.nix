{ config, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  services.pulseaudio.support32Bit = true;
  powerManagement.cpuFreqGovernor = "performance";

  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
      open = false;
    };
  };

  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };
}
