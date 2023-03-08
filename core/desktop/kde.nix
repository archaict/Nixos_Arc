{ config, pkgs, lib, ... }:

{

  services.gnome.gnome-keyring.enable = true;
  services.touchegg.enable = true;
  services.xserver = {
    desktopManager.plasma5.enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "sugar-dark";
      settings.Wayland.SessionDir = "${pkgs.plasma5Packages.plasma-workspace}/share/wayland-sessions";
    };

    displayManager.sessionPackages = [
      (pkgs.plasma-workspace.overrideAttrs
      (old: { passthru.providedSessions = [ "plasmawayland" ]; }))
    ];

    # # BSPWM
    # windowManager.bspwm.enable = true;
    # displayManager.defaultSession = "plasma5+bspwm";
    # displayManager.session = [{
    #   manage = "desktop";
    #   name = "plasma5+bspwm";
    #   start = ''exec env KDEWM=${pkgs.bspwm}/bin/bspwm ${pkgs.plasma-workspace}/bin/startplasma-x11'';
    # }];

    # Hyprland
    # displayManager.defaultSession = "hyprland";
    # displayManager.session = [{
    #   manage = "desktop";
    #   name = "Hyprland";
    #   start = ''Hyprland'';
    # }];

  };

  programs.kdeconnect.enable = true;
  environment.systemPackages = let themes = pkgs.callPackage ./sddm-themes.nix {}; in [
    pkgs.ark
    pkgs.libsForQt5.frameworkintegration
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.libsForQt5.bismuth
    pkgs.xorg.xbacklight
    pkgs.libsForQt5.sddm-kcm
    pkgs.extra-cmake-modules
    #pkgs.qt5.full
    pkgs.krunner-symbols
    themes.sddm-sugar-dark
    themes.sddm-sugar-light
    pkgs.wl-clipboard
    pkgs.ktorrent
    # pkgs.unstable-kde.plasma-desktop
    pkgs.plasma-desktop
    # pkgs.albert
    pkgs.touchegg
    pkgs.latte-dock
    # pkgs.ocs-url

    pkgs.krunner-pass
    pkgs.rxvt-unicode
  ];

  # systemd.services.autostart-kde = {
  #   enable = true;
  #   description = "KDE Autostart Script";
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.bash}/bin/bash /home/archaict/.config/kdeautostart.sh";
  #   };
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];

  # };

}
