{ pkgs, inputs, ... }:

let 
vscode-insiders = (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
    src = (builtins.fetchTarball {
        url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
        sha256 = "1cm05p2kcmcp50w8gzxyl9wv394vafay9js26csbzq5qyb0l2z3f";
    });
    version = "1.74";
});

in {
  # Unstable Packages

  environment.systemPackages = with pkgs; [

    ((emacsPackagesFor emacs28NativeComp).emacsWithPackages (epkgs: [
      epkgs.vterm
      epkgs.sqlite
      epkgs.exwm
      epkgs.pdf-tools
    ]))

    neovim
    neovim-remote
    # archi
    # vscodium
    # inputs.nvem.packages.x86_64-linux.nvem

    obsidian
    # logseq
    unstable.vscode
    vscode-insiders
    unstable.helix

    unstable.postman
    unstable.insomnia

    tree-sitter
  ];

}
