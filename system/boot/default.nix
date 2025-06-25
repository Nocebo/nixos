{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./systemd.nix
    ./grub.nix
    ./lacie-harddrive.nix
  ];
}
