{
  pkgs,
  lib,
  config,
  ...
}: {
  options.boot.grub = lib.mkEnableOption "Enable GRUB bootloader";

  config = lib.mkIf config.boot.grub {
    boot.loader.efi.canTouchEfiVariables = true;
    # grub considering the hardware configuration
    boot.loader.grub = {
      enable = true;
      devices = ["nodev"]; # Use grub with EFI, no specific device
      efiSupport = true; # Enable EFI support
      useOSProber = true; # Optional: detect other operating systems
      efiInstallAsRemovable = false; # Set to true only if you have boot issues
    };
  };
}
