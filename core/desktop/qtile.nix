{ config, pkgs, lib, ... }:

{

  services.xserver = {

    # displayManager.startx.enable = true;
    # desktopManager.gnome.enable = false;
    # desktopManager.xterm.enable = true;

    # XMonad
    # displayManager.defaultSession = "none+qtile";
    windowManager.qtile.enable = true;

  };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       user = "archaict";
  #       command =
  #         "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --greeting 'CODE // 0X' --time --width 40 --cmd 'startx > /dev/null 2>&1'";
  #     };
  #   };
  # };

  environment.systemPackages = with pkgs; [
    dmenu
    rofi
    networkmanager_dmenu
    # greetd.tuigreet
  ];

}
