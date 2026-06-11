let
  theme = import ../themes/pixel.nix;
in

{
  _module.args.theme = theme;
}
