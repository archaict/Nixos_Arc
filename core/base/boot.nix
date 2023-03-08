{ config, pkgs, flake, inputs, ... }:

{
  #imports = [ inputs.grub2-themes.nixosModule ];
  boot = {
    loader = {
      timeout = 1;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      # grub = {
      #   enable = false;
      #   useOSProber = true;
      #   efiSupport = true;
      #   device = "nodev";
      #   version = 2;
      #   # splashImage = null;
      #   # backgroundColor = "#0f1419" ;
      #   # theme = pkgs.nixos-grub2-theme;
      #   extraConfig = ''
      #     GRUB_EARLY_INITRD_LINUX_CUSTOM="acpi_s3_override"
      #   '';
      # };

     # grub2-theme = {
     #   enable = false;
     #   icon = "white";
     #   theme = "whitesur";
     #   screen = "1080p";
     #   # splashImage = splash;
     #   footer = true;
     # };

    };

    # kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_xanmod;
    # extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    # kernelModules = [ "vhost_vsock" "v4l2loopback" "uhid" ];
    # kernelParams = [ "quiet" "acpi_backlight=video" "mem_sleep_default=deep" "psmouse.synaptics_intertouch=0" ];
    # kernelParams = [ "mem_sleep_default=deep" "resume_offset=35821568" ];
    resumeDevice ="/dev/disk/by-uuid/afc97001-d40d-49ab-8be8-e470bf0f4691";

   # plymouth = {
   #   enable = true;
   #   theme = "breeze";
   # };

  };
  # security.protectKernelImage = false;
  #hardware.enableRedistributableFirmware = true;

}
