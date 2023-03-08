{ pkgs, ... }:

{
  # Security Packages
  environment.systemPackages = with pkgs; [
    nmap
    whois
    protonvpn-cli
    wireshark
    netcat
    # nload
    # nagios

    pass
    gnupg

    qtpass
    pinentry-qt
    pinentry-emacs

    hping
    # mosquitto
  ];

  programs.gnupg.agent.enable = true;

  # services.mosquitto = {
  #   enable = true;
  #   listeners = [ {
  #     port = 1883;
  #     acl = [ "topic readwrite #" ];
  #     omitPasswordAuth = true;
  #     settings.allow_anonymous = true;
  #   } ];
  # };

}
