{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = (import ./fish-init.nix).init;
    shellAbbrs = {
      ghcl = "git clone https://github.com/";
    };
    plugins = [

      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
          sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
        };
      }

      {
       name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "ixyf2xwnx2gcihiqrl9dvrnllc4qg4i9";
          sha256 = "162zm6mhv2hr2cn6gl7cl840ppr3mgbjwa0w0x7a76124l33iz06";
        };
      }

      {
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "1.16.2";
          sha256 = "08f103y0d71gfh6x3h8lwv269vhfkwmc9bahd321r2zwrvkz0xav";
        };
      }

      {
        name = "nix-completions.fish";
        src = pkgs.fetchgit {
          url = "https://github.com/kidonng/nix-completions.fish";
          rev = "dcb15c4f7d3e85d8f7cd3eb09b3014ccd278aab8";
          sha256 = "sha256-3HHcaX2yVZXrRjOeSlI8tPhSjRR2tPU6AWq6eU5nPOs=";
        };
      }

    ];


  };
}
