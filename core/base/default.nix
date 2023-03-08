{ config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./networking.nix
    # ./battery.nix
    ./systemd.nix
    ./hardware-configuration.nix
  ];

  services.gvfs.enable = true;
  # services.udisks2.enable = true;
  # services.devmon.enable = true;

}
