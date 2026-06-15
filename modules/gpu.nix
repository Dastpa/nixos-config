{ config, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  services.pulseaudio.support32Bit = true;

  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
    };
  };

  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
  };
}
