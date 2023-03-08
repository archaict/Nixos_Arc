# Bluetooth tools

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bluez
    bluez-alsa
    bleak
    redfang
  ];
}
