{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
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

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
