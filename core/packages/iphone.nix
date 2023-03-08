{ config, lib, pkgs, ... }:

{

  services.usbmuxd.enable = true;
  # services.avahi = {
  #   enable = true;
  #   nssmdns = true;
  #   publish.enable = true;
  #   publish.userServices = true;
  # };
  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse
    # tcpdump
    # rpiplay
  ];

}
