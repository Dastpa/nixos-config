{ config, pkgs, ... }:

{
  home.username = "patrick";
  home.homeDirectory = "/home/patrick";

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  home.file = {
    ".config/foot/foot.ini".source = ../config/foot.ini;
    ".config/sway/config".source = ../config/sway/config;
    ".config/waybar/config.jsonc".source = ../config/waybar/config.jsonc;
    ".config/waybar/style.css".source = ../config/waybar/style.css;
  };
}
