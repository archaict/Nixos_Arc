{ pkgs, ... }:

{
  # Command Line Packages
  environment.systemPackages = with pkgs; [
    fzf
    fzf-zsh
    fzf-obc
    zsh-fzf-tab

    sysz

    ytfzf
  ];

}