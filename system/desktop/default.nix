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
    ./plasma.nix
    ./nodesktop.nix
    ./xfce.nix
    ./stylix.nix
  ];
}
