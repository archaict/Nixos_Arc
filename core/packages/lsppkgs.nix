{ pkgs, ... }:

{ # Language-server Packages
  environment.systemPackages = with pkgs; [
    sumneko-lua-language-server
    nodePackages.bash-language-server
    nodePackages.yaml-language-server
    nodePackages.pyright
    nodePackages.vim-language-server
    rnix-lsp
    nixfmt
    nixpkgs-fmt
    java-language-server
  ];
}
