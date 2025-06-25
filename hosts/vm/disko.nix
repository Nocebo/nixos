{lib, ...}: {
  disko.devices = {
    disk = {
      vda = {
        type = "disk";
        device = "/dev/sde";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              name = "boot";
              size = "512M";
              type = "EF00"; # EFI System Partition
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["defaults"];
              };
            };
            swap = {
              name = "swap";
              size = "2G";
              content = {
                type = "swap";
              };
            };
            root = {
              name = "root";
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = ["defaults"];
              };
            };
          };
        };
      };
    };
  };
}
