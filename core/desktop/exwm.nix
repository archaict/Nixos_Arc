{ config, pkgs, lib, ... }:

{

  services.getty = {
    # autologinUser = "archaict";
    helpLine = "";
    extraArgs = [ "-n" "-o" "archaict" "%I" ];
  };

  services.xserver = {

    windowManager.exwm = {
      enable = true;
      enableDefaultConfig = false;
    };

    displayManager.startx.enable = true;

  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "archaict";
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --asterisks --greeting 'CODE // 0X' --time --cmd startx";
      };
    };
  };

  environment.systemPackages = with pkgs; [
      greetd.tuigreet
  ];

}
