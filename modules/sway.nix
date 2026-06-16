{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = [ "--unsupported-gpu" ];
  };

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
    # Force applications to use Wayland
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "sway";
    XDG_CURRENT_DESKTOP = "sway";
    NIXOS_OZONE_WL = "1"; # Forces Electron apps (Discord, VS Code) to run natively in Wayland

    # Crucial fix for invisible/flickering cursor on Nvidia + Wayland
    SWAY_UNSUPPORTED_GPU = "true";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
