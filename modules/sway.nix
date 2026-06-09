{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = [ "--unsupported-gpu" ];
  };

  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    sway
    waybar
    wofi
    foot
    mako
    grim
    slurp
    wl-clipboard
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
