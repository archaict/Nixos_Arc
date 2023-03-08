{ config, pkgs, ... }:

{

  users = {

    # defaultUserShell = pkgs.fish;
    defaultUserShell = pkgs.zsh;

    users.archaict = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "tty"
        "input"
        "audio"
        "sound"
        "video"
        "networkmanager"
        "docker"
        "vboxusers"
        "kvm"
        "libvirtd"
        "qemu-libvirtd"
        "adbusers"
        "lxd"
        "wireshark"
        "udev"
        "dialout"
      ];
    };

  };

  time.timeZone = "Asia/Jakarta";
  time.hardwareClockInLocalTime = true;

  networking.hostName = "nixos-laptop";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # environment.sessionVariables = {
  #   EDITOR = "nvim";
  #   TERMINAL = "alacritty";
  # };

}
