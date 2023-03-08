{ config, lib, pkgs, ... }:

{

  containers.browser = {
    autoStart = false;
    privateNetwork = true;
    hostAddress = "192.168.10.10";
    localAddress = "192.168.10.11";
    config = {config, pkgs, ... }: {
      services.openssh = {
        enable = true;
        forwardX11 = true;
      };

      users.extraUsers.browser = {
        isNormalUser = true;
        home = "/home/browser";
        openssh.authorizedKeys.keys = [ /home/archaict/.ssh/tor.sha256 ];
        extraGroups = ["audio" "video"];
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 4713 6000 ];

  hardware.pulseaudio = {
    tcp = { enable = true;
      anonymousClients = {
        allowedIpRanges = ["127.0.0.1" "192.168.7.0/24"];
      };
    };
  };

  networking.nat.enable = true;
  networking.nat.internalInterfaces = ["ve-browser"];
  # networking.nat.externalInterface = "";

}
