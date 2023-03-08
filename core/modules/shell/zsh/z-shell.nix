{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    enableCompletion      = true;
    enableAutosuggestions = true;

    dotDir = "$HOME/.config/zsh";

    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.local/share/history/.history";

      share       = true;
      extended    = true;
      ignoreDups  = true;
      ignoreSpace = true;
    };
  };
}
