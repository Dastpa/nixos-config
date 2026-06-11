{ theme, ... }:

{
  services.mako = {
    enable = true;

    backgroundColor =
      theme.colors.background;

    borderColor =
      theme.colors.accent;
  };
}
