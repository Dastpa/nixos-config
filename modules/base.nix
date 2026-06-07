{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    htop
  ];

  programs.zsh.enable = true;

  services.openssh.enable = true;
}
