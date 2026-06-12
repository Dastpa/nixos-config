{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/home.nix
    ../../modules/base.nix
    ../../modules/gpu.nix
    ../../modules/sway.nix
    ../../modules/displaylink.nix
    ../../modules/audio.nix

    # Theming
    ../../modules/desktop/theme.nix
  ];

  system.stateVersion = "25.05";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users.users.patrick = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
  };

  networking = {
    hostName = "nixos-desktop";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Timezone
  time.timeZone = "Europe/London";

  # Keyboard layout
  console.useXkbConfig = true;
  services.xserver = {
    enable = true;
    xkb.layout = "gb";
    xkb.variant = "";
  };

  environment = {
    systemPackages = with pkgs; [
      firefox
      pciutils
      zed-editor
      home-manager
    ];

    variables = {
      XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
      XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
    };
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
}
