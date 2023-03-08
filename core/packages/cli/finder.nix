{ pkgs, ... }:

{
  # Command Line Packages
  environment.systemPackages = with pkgs; [
    fd
    silver-searcher
    ripgrep

  ];

}