{
  config,
  lib,
  ...
}: {
  imports = [
    ./k3s.nix
    ./docker.nix
  ];
}
