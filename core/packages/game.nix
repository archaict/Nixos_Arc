{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs;[
    # Wine Tools
    # wineWowPackages.stable
    # winetricks
    # protontricks
    # xorg.libXcomposite
    # xorg.libXinerama

    # lutris
    # cdemu-daemon
    # cdemu-client
    # giflib
    # libpng
    # gnutls
    # mpg123
    # openal
    # v4l-utils
    libpulseaudio
    alsaPlugins
    alsaLib
    # libjpeg
    # python39Packages.pyturbojpeg
    # khronos-ocl-icd-loader
    # rocm-opencl-icd
    # libxslt
    # libva
    # gst_all_1.gst-plugins-base
    # gst_all_1.gst-plugins-good
    # gst_all_1.gst-plugins-bad
    # gst_all_1.gst-plugins-ugly
    # libgudev
    # vulkan-loader

    ## Games
    # cataclysm-dda
    # cpupower-gui

    ## Switch
    # yuzu-ea
    # yuzu-mainline
    # playonlinux

  ];

  programs.steam.enable = true;

  # programs.gamemode.enable = true;
  # programs.gamemode.settings.general.inhibit_screensaver = 0;

}
