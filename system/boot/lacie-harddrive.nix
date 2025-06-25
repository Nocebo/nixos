{
  pkgs,
  lib,
  config,
  ...
}: {
  fileSystems."/mnt/lacie" = {
    device = "/dev/disk/by-uuid/af49697f-36a8-4d65-a192-a3f1da3af47e";
    fsType = "ext4";
    options = [
      "nofail"
      "x-systemd.device-timeout=10s"
      "x-systemd.automount"
      "rw"
    ];
  };

  systemd.tmpfiles.rules = [
    "z /mnt/lacie 0770 kleanzy users"
  ];
}
