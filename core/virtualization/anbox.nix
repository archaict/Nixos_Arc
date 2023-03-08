{ config, pkgs, lib, ... }:

{
  virtualisation.anbox = {
    enable = true;
    image = pkgs.anbox.image;
    ipv4 = {
      dns = "1.1.1.1";
      gateway.address = "192.168.250.1";
      gateway.prefixLength = 24;
      container.address = "192.168.250.2";
      container.prefixLength = 24;
    };

  };

}
