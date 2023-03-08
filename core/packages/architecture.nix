{ pkgs, ... }:

{

  # Development Packages

  environment.systemPackages = with pkgs; [

    plantuml
    plantuml-server
    ganttproject-bin

  ];

}
