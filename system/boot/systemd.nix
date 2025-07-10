{
  pkgs,
  lib,
  config,
  ...
}: {
  options.useboot.systemd = lib.mkEnableOption "Enable GRUB bootloader";

  config = lib.mkIf config.useboot.systemd {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
