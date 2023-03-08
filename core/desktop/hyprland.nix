{ config, pkgs, lib, ... }:

{

  programs.hyprland.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.xserver = {
    displayManager.startx.enable = true;
    desktopManager.gnome.enable = false;
    desktopManager.xterm.enable = true;
    displayManager.defaultSession = "none+Hyprland";
  };

  environment.systemPackages = with pkgs; [
    wdisplays
    waybar
    wofi
    rofi-wayland
    hyprpaper
    swaybg
    libinput-gestures
    nm-tray
  ];

  services = {
  
    physlock = {
      enable = true;
      allowAnyUser = true;
      lockOn.suspend = true;
      lockOn.hibernate = true;
    };
  
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "archaict";
          command =
            "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --greeting 'CODE // 0X' --time --width 40 --cmd 'startx > /dev/null 2>&1'";
        };
      };
    };

  };

}
