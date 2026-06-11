{ pkgs, theme, ... }:

{
  programs.waybar = {
    # enable = true;

    style = ''
      * {
        font-family: ${theme.font};
      }

      window#waybar {
        background: rgba(11,16,32,0.85);
      }

      #workspaces button.active {
        background: ${theme.colors.accent};
      }
    '';
  };
}
