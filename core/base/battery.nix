{

  # powerManagement = {
  #   enable = true;
  #   powertop.enable = false;
  # };

  services = {
    tlp = {
      enable = true;
      settings = {
        TLP_DEFAULT_MODE = "BAT";
        SOUND_POWER_SAVE_ON_AC = 0;
        WIFI_PWR_ON_AC = "on";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_MAX_PERF_ON_BAT = 200;
        CPU_BOOST_ON_BAT = 1;
        AHCI_RUNTIME_PM_ON_BAT = "auto";

        START_CHARGE_THRESH_BAT0 = 95;
        STOP_CHARGE_THRESH_BAT0 = 99;
        RESTORE_THRESHOLDS_ON_BAT = 1;
      };
    };

#     upower = { enable = true; };

  };
}
