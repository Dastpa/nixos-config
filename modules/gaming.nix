{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/patrickdastey/.local/share/Steam/steamapps/common";
  };
}
