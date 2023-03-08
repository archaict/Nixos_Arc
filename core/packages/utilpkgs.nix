{ pkgs, ... }:

{ # Tools Packages
  environment.systemPackages = with pkgs;
    [
        usbutils
        hdparm
        ddrescue
        psensor
        # gdown
        woeusb
        ventoy-bin
    ];
}
