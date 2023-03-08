{ config, lib, pkgs, ... }:

{
  imports = [
    # ./anbox.nix
    # ./tor-container.nix
  ];

  virtualisation = {
    lxd.enable = true;
    lxc.lxcfs.enable = true;

    libvirtd = {
      enable = true;
      qemu.runAsRoot = false;
      qemu.ovmf.enable = true;
      qemu.ovmf.packages = [pkgs.unstable.OVMFFull];
    };

    docker.enable = true;
    podman = {
      enable = true;
      # dockerSocket.enable = true;
      defaultNetwork.dnsname.enable = true;
    };


   # virtualbox.host.enable = true;
   # virtualbox.host.enableExtensionPack = true;

  };

  services.qemuGuest.enable = true;

  # https://persevering.dev/posts/lxd-vms-on-nixos/
  # Just in case vm not work on nixos inside lxd

  environment.systemPackages = with pkgs; [
    docker-compose 
    quickemu 
    virglrenderer
    spice-gtk
  ];

}
