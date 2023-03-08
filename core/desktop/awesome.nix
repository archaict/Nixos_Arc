{ config, pkgs, lib, ... }:

{

  services.xserver = {

    desktopManager = {
      gnome.enable = false;
      xterm.enable = true;
    };

    # Awesome
    displayManager = {
      startx.enable = true;
      defaultSession = "none+awesome";
    };

    windowManager = {
      awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };
      i3 = {
        enable = true;
      };
    };


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
      # greetd.tuigreet
  ];

}
