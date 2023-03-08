{ pkgs, ... }:

{
  #  Language Python

  environment.systemPackages = with pkgs; [
    arduino
    arduino-cli
    platformio
  ];

}
