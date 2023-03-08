# Host security tools

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo-audit
    checksec
    chkrootkit
    lynis
    vulnix
  ];
}
