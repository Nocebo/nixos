{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [];

  fileSystems."/" = {
    device = "/dev/disk/by-label/root";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [{device = "/dev/disk/by-label/swap";}];
}
