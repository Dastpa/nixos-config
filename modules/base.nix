{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System Utils
    pciutils
    usbutils
    home-manager
    btop
    nixd
    nil
    curl
    ncdu
    wget
    fastfetch

    # Development
    git
    vim
    gnumake

    # Apps
    firefox
    zed-editor
    steam
    prismlauncher
  ];

  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    fira-code
    fira-code-symbols
    font-awesome
    liberation_ttf
    mplus-outline-fonts.githubRelease
    # nerdfonts
    noto-fonts
    noto-fonts-color-emoji
    proggyfonts
  ];

  programs.zsh.enable = true;

  services.openssh.enable = true;
}
