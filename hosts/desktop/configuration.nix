{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/gpu.nix
    ../../modules/sway.nix
    ../../modules/displaylink.nix
    ../../modules/audio.nix
  ];

  networking.hostName = "nixos-desktop";

  time.timeZone = "Europe/London";

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.patrick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
  };

  system.stateVersion = "25.05";
}
