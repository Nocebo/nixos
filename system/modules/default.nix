{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./user.nix
    ./localization.nix
    ./cleanup.nix
    ./virt.nix
    ./gaming.nix
  ];
}
