{ config, lib, pkgs, ... }:

{

  imports = [
    #./fish
    ./bash
    # ./zsh
  ];

  programs.bat = {
    enable = true;
    config.theme = "Catppuccin-mocha";
  };

}
