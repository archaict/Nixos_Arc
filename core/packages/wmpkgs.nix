{ pkgs, ... }:

{ # Window Manager Packages

  programs.light.enable = true;
  environment.systemPackages = with pkgs; [

    acpi
    light
    tlp

    # fusuma

    feh
    xdotool
    wmctrl
    pywal

    xclip
    dunst
    libnotify

    unclutter-xfixes
    lxappearance
    picom
    # picom-pijulius
    # picom-jonaburg

    pulseaudio
    alsaTools

    scrcpy
    # uns-qtscrcpy.qtscrcpy

    (polybar.override {
      pulseSupport = true;
      alsaSupport = true;
      nlSupport = true;
    })

  ];

  programs.dconf.enable = true;

}
