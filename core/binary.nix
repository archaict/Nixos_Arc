{ config, pkgs, ... }:

let
  bkbd = pkgs.writeShellScriptBin "bkbd" ''

    notify-send "Kmonad for Keychron"
    keyb=/dev/input/$(grep -B 8 -A 4 12001 /proc/bus/input/devices | grep Keychron -A 4 | grep -oE 'event[0-9]+')
    dest="/tmp/kmonad-keychron-k12.kbd"
    cp ~/.config/kmonad/config.kbd $dest
    sed -i 's:/dev/input/by-path/platform-i8042-serio-0-event-kbd:'$keyb':' $dest
    kmonad $dest &
    disown

  '';
  refbkbd  = pkgs.writeShellScriptBin "refbkbd"  ''
    rm /tmp/kmonad-keychron-k12.kbd && sudo pkill kmonad && bkbd
    notify-send "Refresh Kmonad"
  '';
  sayonara = pkgs.writeShellScriptBin "sayonara" "shutdown -h now";
  daijoubu = pkgs.writeShellScriptBin "daijoubu" "reboot";

in {
  environment.systemPackages = [
    bkbd
    refbkbd
    sayonara
    daijoubu
  ];
}
