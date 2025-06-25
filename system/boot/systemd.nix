{
  pkgs,
  lib,
  config,
  ...
}: {
  options.bootSystemd = lib.mkEnableOption "Enable GRUB bootloader";

  config = lib.mkIf config.bootSystemd {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
