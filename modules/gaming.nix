{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.gamescope
  ];

  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
}
