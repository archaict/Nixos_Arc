# Password and hashing tools

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    authoscope
    bruteforce-luks
    brutespray
    crunch
    hashcat
    hashcat-utils
    hashdeep
    john
    medusa
    nasty
    ncrack
    phrasendrescher
    python3Packages.patator
    thc-hydra
    truecrack
  ];
}
