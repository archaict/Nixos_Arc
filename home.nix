{ config, lib, pkgs, ... }:

{

  programs.home-manager.enable = true;

  home.username = "archaict";
  home.homeDirectory = "/home/archaict";
  home.stateVersion = "22.11";
  xdg.enable = true;

  manual.json.enable = true;
  news.display = "silent";

  imports = [

    ./core/modules/shell
    # ./core/modules/fusuma.nix
    # ./core/modules/firefox.nix
    ./core/modules/neovim.nix
    ./core/modules/gtk.nix
    ./core/modules/codium.nix
    ./core/modules/plasma-manager.nix

  ];

  home.file= {
    ".profile".source = ./codex/home/.profile;
  };

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = 1;
    # WINEPREFIX="~/.winevn WINEARCH=win32 wineboot";
  };

}
