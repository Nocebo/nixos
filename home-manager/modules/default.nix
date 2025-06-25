{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./shell.nix
    ./stylix-wallpaper.nix
  ];
}
