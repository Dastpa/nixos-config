{ ... }:

{
  system.stateVersion = "25.05";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.patrick = import ../../modules/home.nix;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users.users.patrick = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "input"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/locality.nix
    ../../modules/gpu.nix
    ../../modules/sway.nix
    ../../modules/audio.nix
    ../../modules/gaming.nix
    ../../modules/networking.nix
  ];
}
