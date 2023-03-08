{ pkgs, inputs, ... }:

{

  environment.systemPackages = with pkgs; [
    alacritty
    kitty
    cool-retro-term
    termius

    zsh
    bash
    fish
    nushell
  ];

}