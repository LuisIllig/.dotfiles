{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" "amd-pstate" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [
    "initcall_blacklist=acpi_cpufreq_init"
    "amd_pstate.shared_mem=1"
    "amd_pstate=passive"
  ];


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

  hardware.opengl = {
    enable = true;
    driSupport = true;
    # extraPackages = with pkgs; [
    #   vaapiVdpau
    #   libvdpau-va-gl
    # ];
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

      CPU_ENERGY_PERF_POLICY_ON_AC = "schedutil";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "schedutil";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
    };
  };

}
