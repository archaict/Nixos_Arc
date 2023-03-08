{ pkgs, ... }:

{
  # Graphical Interface Packages
  environment.systemPackages = with pkgs; [
    xwinwrap

    tela-icon-theme
    capitaine-cursors
    gnome3.adwaita-icon-theme

    xorg.xhost
    obs-studio

    gtk3
    autorandr
    arandr
    libinput

    # xournal

    mpv
    gparted
    # vlc
    pavucontrol
    sxhkd

    barrier

    gromit-mpx
    flameshot
    imagemagick

    zoom-us
    # droidcam
    appimage-run

    onlyoffice-bin

    zathura
    sxiv
    # simplescreenrecorder

    unstable.virt-manager

    pcmanfm
    jmtpfs
    archiver

    betterlockscreen

    openssl

    # obs-studio
    xinput_calibrator

    xorg.xev

    ncurses
    cups
  ];

}
