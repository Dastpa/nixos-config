{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  hardware.graphics.enable = true;

  # This is the vital missing link. It activates the displaylink systemd daemon.
  services.xserver.videoDrivers = [ "displaylink" "nvidia" ];

  # Explicitly load the EVDI module for virtual framebuffers
  boot = {
    extraModulePackages = [ config.boot.kernelPackages.evdi ];
    initrd.kernelModules = [ "evdi" ];
  };
}
