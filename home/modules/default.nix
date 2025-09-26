{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./shell.nix
    ./user.nix
    ./nushell.nix
  ];
}
