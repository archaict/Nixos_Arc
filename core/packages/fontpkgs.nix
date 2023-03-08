{ config, lib, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
    };

    fonts = with pkgs; [

      iosevka

      # Alternative Fonts
      jost
      aileron

      # carlito

      fira-code
      ubuntu_font_family
      unifont
      font-awesome
      siji
      noto-fonts
      # noto-fonts-cjk

      (nerdfonts.override { fonts = [ "Iosevka" "FiraCode" ]; })

    ];
  };
}
