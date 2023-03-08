{ config, lib, pkgs, ... }:

{

  imports = [
    # ./security/bluetooth.nix
    # ./security/code.nix
    # ./security/dns.nix
    # ./security/forensics.nix
    # ./security/fuzzers.nix
    # ./security/generic.nix
    # ./security/hardware.nix
    # ./security/host.nix
    # ./security/information-gathering.nix
    # ./security/malware.nix
    # ./security/misc.nix
    # ./security/mobile.nix
    # ./security/network.nix
    # ./security/packet-generators.nix
    # ./security/password.nix
    # ./security/port-scanners.nix
    # ./security/proxies.nix
    # ./security/services.nix
    # ./security/smartcards.nix
    # ./security/ssl-tls.nix
    # ./security/terminals.nix
    # ./security/traffic.nix
    # ./security/tunneling.nix
    # ./security/voip.nix
    # ./security/wireless.nix

  ];
}
