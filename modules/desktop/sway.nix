{ pkgs, theme, ... }:

{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      modifier = "Mod4";

      terminal = "foot";

      menu = "wofi --show drun";

      startup = [
        { command = "waybar"; }
        { command = "mako"; }

        {
          command =
            "mpvpaper '*' ${toString theme.wallpaper}";
        }
      ];
    };
  };
}
