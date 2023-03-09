{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/2c35a61b-22ca-458a-8970-3ab316a7fd1e";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-b8fe3eaf-6dc4-442a-80de-b5bddd1f515f".device = "/dev/disk/by-uuid/b8fe3eaf-6dc4-442a-80de-b5bddd1f515f";

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/918E-6750";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.video.hidpi.enable = lib.mkDefault true;
}
