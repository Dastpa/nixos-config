{ config, ... }:

{
  # Timezone
  time.timeZone = "Europe/London";

  # Keyboard layout
  console.useXkbConfig = true;
  services.xserver = {
    enable = true;
    xkb.layout = "gb";
    xkb.variant = "";
  };

  environment = {
    variables = {
      XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
      XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
    };
  };
}
