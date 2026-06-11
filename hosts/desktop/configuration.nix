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

  nixpkgs.config.allowUnfree = true;  

  networking.hostName = "nixos-desktop";

  time.timeZone = "Europe/London";

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.patrick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
  };
  
  console.useXkbConfig = true;

  services.xserver = {
    enable = true;
    xkb.layout = "gb";
    xkb.variant = "";
  };
   
  environment.systemPackages = with pkgs; [
    firefox
    pciutils
  ];

  environment.variables = {
    XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
    XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.05";
}
