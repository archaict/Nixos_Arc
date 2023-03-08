{ pkgs, ... }:

{
  # Command Line Packages
  environment.systemPackages = with pkgs; [
    git
    delta
    gitui
    lazygit
  ];
}