{ config, lib, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [

    nodePackages.prettier
    nodePackages.typescript-language-server
    nodePackages.typescript
    # nodePackages.webpack-cli

  ];

}
