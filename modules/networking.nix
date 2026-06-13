{ ... }:

{
  # Turn off usb cd drivers and expose real devices (Realtek Wifi Dongle)
  hardware.usb-modeswitch.enable = true;

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
}
