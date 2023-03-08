{

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowBroken = true;
  # services.flatpak.enable = true;

  imports = [

    ./clipkgs.nix
    ./guipkgs.nix
    ./wmpkgs.nix

    ./automation.nix

    ./corepkgs.nix
    #./extpkgs.nix
    ./fontpkgs.nix
    #./iphone.nix

    ./devpkgs.nix
    # ./laravel.nix
    # ./react.nix
    # ./lsppkgs.nix

    # ./optpkgs.nix
    # ./texpkgs.nix
    ./chatpkgs.nix

    ./unstablepkgs.nix
    ./utilpkgs.nix

    ./editorpkgs.nix
    ./secpkgs.nix

    # ./game.nix
    ./browser.nix
    ./architecture.nix
    ./academics.nix
    ./design.nix
    ./terminal.nix


    # ./security
    # ./cuspkgs.nix

  ];

}
