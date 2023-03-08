{ pkgs, ... }:

{
  #  Language Python

  environment.systemPackages = with pkgs; [
    python39Full
    python39Packages.pip

    jupyter
    python39Packages.jupyter_core
    stdenv.cc.cc.lib

    # unstable.md-tangle
  ];

}
