{ config, pkgs, lib, ... }:

{

  nixpkgs.config.pulseaudio = true;
  environment.systemPackages = with pkgs; [
    pa_applet
  ];

  hardware = {

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      # extraModules = [ pkgs.pulseaudio-modules-bt ];
      extraConfig = ''
        unload-module module-suspend-on-idle
        unload-module module-switch-on-port-available
        load-module module-switch-on-connect
        load-module module-bluetooth-policy
        load-module module-bluetooth-discover
      '';
      # configFile = pkgs.runCommand "default.pa" {} ''
      #   sed 's/module-udev-detect$/module-udev-detect tsched=0/' \
      #     ${pkgs.pulseaudio}/etc/pulse/default.pa > $out
      # '';
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Enable = "Source,Sink,Media,Socket";
    };

  };

  services.blueman.enable = true;

  services.mpd = {
    enable = true;
    user = "archaict";
    group = "users";
    musicDirectory = "/home/archaict/vault/Music";
    startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type "pulse"
        name "pulseaudio"
        server "127.0.0.1"
      }
    '';
  };
}
