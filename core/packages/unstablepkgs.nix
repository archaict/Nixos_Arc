{ pkgs, ... }:

{ # Unstable Packages
  environment.systemPackages = with pkgs.unstable; [
    stylua
    # suricata
    # unstable.starship
    # etcher
    # snort3
  ];
}
