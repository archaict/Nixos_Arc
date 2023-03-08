{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ fusuma ];
  services.fusuma = {
    enable = true;
    extraPackages = with pkgs;[ xdotool coreutils ];

    settings = {
      swipe = {
        "3" = {
          up = { command = "xdotool key ctrl+Page_Up"; };
          down = { command = "xdotool key ctrl+Page_Down"; };
          left = { command = "xdotool key alt+Left"; };
          right = { command = "xdotool key alt+Right"; };
        };
        "4" = {
          up = { command = "xdotool key ctrl+equal"; };
          down = { command = "xdotool key ctrl+minus"; };
          left = { command = "xdotool key alt+Left"; };
          right = { command = "xdotool key alt+Right"; };
        };
      };
      pinch."in".command = "xdotool key ctrl+minus";
      pinch."out".command = "xdotool key ctrl+equal";
    };
  };

}
