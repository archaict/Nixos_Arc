{ config, lib, pkgs, ... }:

{
  programs.bash = {
    # enable = true;
    # bashrcExtra = ''
    #   eval "$(starship init bash)"
    #   source /etc/nixos/core/modules/shell/aliases
    # '';
    # historySize = 10000;
    # historyFileSize = 10000;
    # historyFile = "$HOME/.local/share/history/.history";
    # historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
    # historyIgnore = [ "exit" "q" ];
    # shellOptions = [
    #   "histappend"
    #   "checkwinsize"
    #   "extglob"
    #   "globstar"
    #   "checkjobs"
    # ];
  };
}
