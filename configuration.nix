{ config, lib, pkgs, inputs, ... }:

{

  imports = [

    ./arcana.nix

    ./core/base
    ./core/nixies.nix
    ./core/regalia.nix

    ./core/packages
    ./core/binary.nix

    ./core/virtualization

  ];

  system.stateVersion = "22.11";

}
