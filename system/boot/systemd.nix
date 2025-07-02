{
  pkgs,
  lib,
  config,
  ...
}: {
  options.boot.systemd = lib.mkEnableOption "Enable GRUB bootloader";

  config = lib.mkIf config.boot.systemd {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
