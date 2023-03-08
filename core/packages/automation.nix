
{ pkgs, ... }:

{

  # Command Line Packages
  environment.systemPackages = with pkgs; [
    ansible ansible-lint
    doctl
    kubectl
    packer
    terraform 
    terraform-ls
    vagrant 
    statix deadnix
    wireguard-tools
  ];
}
