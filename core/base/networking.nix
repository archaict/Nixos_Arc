{ config, pkgs, ... }:

{

  imports = [ ./hosts.nix ];
  networking = {

    networkmanager.enable = true;
    enableIPv6 = false;
    # extraHosts = (import ./hosts.nix).hosts;
    firewall.enable = false;
    # firewall.allowedTCPPorts = [ 8883 ];
    # firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    # firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
    # nftables.enable = true;
    # nftables.ruleset = "";
    # nameservers = [ "1.0.0.1" "1.1.1.1" ];
  };

  environment.systemPackages = with pkgs; [

    arp-scan
    # suricata

  ];


}
