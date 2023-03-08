{ config, lib, pkgs, ... }:

{

  nixpkgs.config = {
    vivaldi = {
      proprietaryCodecs = true;
      enableWideVine = true;
    };
  };

  # https://unix.stackexchange.com/questions/379632/how-to-set-the-default-browser-in-nixos
  # xdg.mime= {
  #   enable = true;
  #   defaultApplications = {
  #     "application/pdf" = "vivaldi";
  #     "text/html" = "vivaldi";
  #     "x-scheme-handler/http" = "vivaldi";
  #     "x-scheme-handler/https" = "vivaldi";
  #     "x-scheme-handler/about" = "vivaldi";
  #     "x-scheme-handler/unknown" = "vivaldi";
  #   };
  # };
  xdg.mime= {
    enable = true;
    defaultApplications = {
      "application/pdf" = "firefox";
      "text/html" = "firefox";
      "x-scheme-handler/http" = "firefox";
      "x-scheme-handler/https" = "firefox";
      "x-scheme-handler/about" = "firefox";
      "x-scheme-handler/unknown" = "firefox";
    };
  };

  environment.systemPackages = with pkgs; [

    # adguardhome
    firefox
    unstable.opera
    microsoft-edge
    # chromium
    # brave
    # nur.repos.wolfangaukang.vdhcoapp
    # tor-browser-bundle-bin

    # (tor-browser-bundle-bin.override {
    #   mediaSupport = true;
    #   pulseaudioSupport = true;
    # })

    # discord
    # betterdiscordctl
    # betterdiscord-installer
    # unstable.legendary-gl

    # signal-desktop
    # vivaldi
    # vivaldi-widevine
    # vivaldi-ffmpeg-codecs

  ];

}
