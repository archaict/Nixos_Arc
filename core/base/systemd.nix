{ config, lib, pkgs, ... }:

{

  systemd.targets.sleep.enable = true;
  systemd.targets.suspend.enable = true;
  systemd.targets.hibernate.enable = true;
  systemd.targets.hybrid-sleep.enable = true;

  systemd.services.kmonad = {
    enable = true;
    description = "kmonad keyboard starter";
    serviceConfig = {
      ExecStart =
        "/home/archaict/bin/kmonad /home/archaict/.config/kmonad/config.kbd";
      Type = "simple";
    };
    wantedBy = [ "graphical.target" ];
  };

  # # Kmonad Bluetooth Services
  # systemd.services.kmonad_bluetooth = {
  #   enable = true;
  #   description = "Keychron";
  #   serviceConfig = {
  #     ExecStart =
  #       "${pkgs.bash}/bin/bash -c /home/archaict/bin/bkbd";
  #     Type = "simple";
  #     Restart = "always";
  #   };
  #   wantedBy = [ "graphical.target" ];
  # };

}
