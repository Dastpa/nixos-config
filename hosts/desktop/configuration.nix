{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/gpu.nix
    ../../modules/sway.nix
    ../../modules/displaylink.nix
    ../../modules/audio.nix
   
    # Theming
    ../../modules/desktop/theme.nix
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
    zed-editor
    home-manager
  ];

  environment.variables = {
    XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
    XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    # If you want the Nerd Font version (recommended for icons in terminal):
    # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.05";
}
