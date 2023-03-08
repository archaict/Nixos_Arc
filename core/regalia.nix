{ config, pkgs, lib, ... }:

{

  imports = [
    # ./desktop/exwm.nix
    # ./desktop/xmonad.nix
    ./desktop/kde.nix
    # ./desktop/qtile.nix
    # ./desktop/hyprland.nix
  ];


  services.xserver = {
    # XServer default
    enable = true;
    layout = "us";
    xkbOptions = "caps:super";
    autoRepeatDelay = 200;
    autoRepeatInterval = 25;

    # Touchpad
    libinput.enable = true;
    libinput.touchpad.tapping = true;
    libinput.touchpad.disableWhileTyping = true;

    # desktopManager.gnome.enable = false;
    # desktopManager.xterm.enable = false;

  };

  services = {

    # physlock = {
    #   enable = true;
    #   allowAnyUser = true;
    #   lockOn.suspend = true;
    #   lockOn.hibernate = true;
    # };

    logind = {
      lidSwitch = "suspend-then-hibernate";
      extraConfig = ''
        HandlePowerKey=suspend-then-hibernate
        IdleAction=suspend-then-hibernate
        IdleActionSec=2m
      '';
      # HandlePowerKey=hibernate
      # IdleAction=ignore
      # LidSwitchIgnoreInhibited=False
    };
  };
  systemd.sleep.extraConfig = "HibernateDelaySec=2h";

  # programs.nm-applet.enable = true;
  # programs.nm-applet.indicator = true;

  # environment.systemPackages = with pkgs; [
  #     networkmanagerapplet
  # ];

}
