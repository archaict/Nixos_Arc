{ pkgs, ... }:

{
  #  Language Java

  environment.systemPackages = with pkgs; [
    # android-studio
    # jdk8
    jdk11
    # ant
    # maven
  ];

  programs.java.enable = true;
  # programs.java.package = pkgs.jdk11;
  # programs.java.package = (
  #   (pkgs.gradleGen.override {
  #     java = pkgs.jdk11;
  #   }).gradle_latest
  # );

}
