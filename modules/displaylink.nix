{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  hardware.graphics.enable = true;

  services.displaylink = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    displaylink
    evdi
  ];
}
