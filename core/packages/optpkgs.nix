{ pkgs, ... }:

{ # Optional Packages
  environment.systemPackages = with pkgs;
    [

      # (cataclysm-dda-git.override {
      #     version = "2021-02-01";
      #     rev     = "cebff34972ec27f550d5d891d22949b78144447b";
      #     sha256  = "0fm5swbczyprbb5w0dcd7mbprgwpc5rj5wvxwfj3i46lnk5y99ws";
      #     useXdgDir = true;
      #   })

      # cataclysm-dda-git.withMods ( mods: with mods; [
      #   tileset.UndeadPeople
      # ])

      nethack
    ];
}
