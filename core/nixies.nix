{ config, pkgs, ... }:

{

  # ExtraOptions & disable things
  nix = {
    package = pkgs.nixUnstable;
    settings.cores = 4;
    settings.max-jobs = 3;
    settings.auto-optimise-store = true;
    extraOptions = ''
      warn-dirty = false
      experimental-features = nix-command flakes
    '';
    settings.substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://aseipp-nix-cache.global.ssl.fastly.net"
    ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # services.lorri.enable = true;

}
