{ pkgs, ... }:

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
    mpvpaper
  ];

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # This is where the magic happens
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    SWAY_UNSUPPORTED_GPU = "true";
  };
}
