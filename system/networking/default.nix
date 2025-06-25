{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./openssh.nix
    ./tailscale.nix
  ];
}
