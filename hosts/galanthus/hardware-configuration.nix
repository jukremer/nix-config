{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [
      "fuse"
      "kvm-intel"
      "coretemp"
    ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a5d90a39-7b34-4112-9d76-90c279ececfb";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/F9B8-FABD";
      fsType = "vfat";
    };

    ## 8 TB HDD
    "/mnt/sdb1" = {
      device = "/dev/disk/by-uuid/10fef994-6ff0-4896-bc34-1ca4403af3d7";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16GB
    }
  ];

  networking = {
    useDHCP = lib.mkDefault true;
    interfaces.eno1.wakeOnLan.enable = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
