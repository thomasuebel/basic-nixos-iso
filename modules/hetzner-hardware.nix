{ config, lib, modulesPath, ... }:

{
  imports = [
    "${modulesPath}/profiles/qemu-guest.nix"
  ];

  boot.initrd.availableKernelModules = [
    "virtio_pci"
    "virtio_scsi"
    "virtio_gpu"
    "ahci"
    "sd_mod"
    "sr_mod"
  ];

  boot.kernelParams = [
    "console=tty1"
    "console=ttyS0,115200n8"
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };
}
