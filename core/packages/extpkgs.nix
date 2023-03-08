{ pkgs, ... }:

{
  # Command Line Packages
  environment.systemPackages = with pkgs; [
    xorg.xf86inputjoystick
    (pkgs.kodi.passthru.withPackages (kodiPkgs: with kodiPkgs; [
      joystick
      jellyfin
    ]))
  ];

  services.fwupd.enable = true;
  # services.cpupower-gui.enable = true;
}

