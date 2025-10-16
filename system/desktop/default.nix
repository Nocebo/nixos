{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    # Desktops
    ./gnome.nix
    ./hyprland.nix
    ./nodesktop.nix
    ./xfce.nix
    ./stylix.nix
  ];
}
