{
  config,
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/virtualisation/qemu-vm.nix"
  ];

  # Disable disko module for VM
  disko.enableConfig = false;

  # Override nixos-generators' filesystem settings
  fileSystems = lib.mkForce {
    "/" = {
      device = "/dev/disk/by-partlabel/disk-vda-root";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-partlabel/disk-vda-boot";
      fsType = "vfat";
    };
  };
}
