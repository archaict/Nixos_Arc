{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [

    home-manager
    any-nix-shell
    niv
    nox
    nix-direnv
    direnv
    nix-prefetch
    nix-prefetch-github
    nixos-icons
    socat
    rnix-lsp
    nixos-generators
    distrobox
  ];

  environment.pathsToLink = [ "/share/nix-direnv" ];
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
