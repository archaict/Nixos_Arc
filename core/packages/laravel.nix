{ config, lib, pkgs, ... }:

{

  networking.firewall.allowedTCPPorts = [ 80 443 3000 ];

  # services.httpd.enable = true;
  # services.httpd.adminAddr = "archadium@mail.com";
  # services.httpd.extraModules = [ "proxy_fcgi" ];

  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  environment.systemPackages = with pkgs; [
    php80
    php80Packages.composer
    mcrypt
    nodePackages.intelephense
    # nodePackages.tailwindcss > manual
    nodePackages.postcss
    nodePackages.autoprefixer
    sqls
  ];

}
