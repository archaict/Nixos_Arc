{ pkgs, ... }:

{

  # Development Packages

  imports = [
    ./language/python.nix
    ./language/java.nix
    ./language/javascript.nix
    ./language/arduino.nix
  ];

  # programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [

    rpi-imager

    sqlite
    gnumake

    act

    # flutter

    # projectlibre

    # R
    # go
    unstable.go_1_19
    lua
    luajitPackages.luarocks
    stylua
    libgudev

    gcc
    unstable.glibc
    ghc
    cmake

    ruby
    cargo

    yarn
    heroku

  ];

  # services.mysql.enable = true;
  # services.mysql.package = pkgs.postgresql;
  # services.postgresql.enable = true;

}
