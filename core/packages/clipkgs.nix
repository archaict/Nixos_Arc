{ pkgs, ... }:

{

  imports = [
    ./cli/git.nix
    ./cli/fzf.nix
    ./cli/finder.nix

  ];

  # Command Line Packages
  environment.systemPackages = with pkgs; [

    libtool
    btop
    glances
    # cmatrix
    # spotdl
    w3m

    tmux
    zellij

    efibootmgr
    parted
    
    # spotify

    zoxide

    p7zip
    # unstable.android-tools

    ranger
    ueberzug

    bc
    ctags
    tree
    pmutils
    man-pages
    ghostscript

    tty-clock

    highlight
    starship

    htop
    # gotop

    pandoc

    figlet
    toilet
    lolcat

    jq
    neofetch
    scrot

    curl
    wget
    rtorrent

    poppler_utils

    isync mu

    lynx

    zip
    unzip
    unrar
    bat
    exa

    ntfs3g

    # mpd
    # mpc_cli
    # ncmpcpp
    ffmpeg
    # youtube-dl

    trash-cli
    # lilypond
    killall

    acpica-tools
    # iasl
    dmidecode

  ];

}
