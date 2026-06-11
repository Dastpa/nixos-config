{ config, pkgs, theme, ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "${theme.font}:size=12";
      };

      colors = {
        background = theme.colors.background;
        foreground = theme.colors.foreground;
      };
    };
  };
}
