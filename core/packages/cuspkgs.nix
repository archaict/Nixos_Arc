{ config, lib, pkgs, ... }:

let
    distrobox = pkgs.callPackage ./custom_packages/distrobox.nix { };
in
{

  environment.systemPackages = with pkgs; [
    distrobox
  ];

}
