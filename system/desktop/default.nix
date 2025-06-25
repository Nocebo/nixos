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

  options.desktop.environment = lib.mkOption {
    type = lib.types.enum ["gnome" "hyprland" "plasma" "xfce" "none"];
    default = "gnome";
    description = "Desktop environment to enable";
  };

  config = {
    gnome.enable = config.desktop.environment == "gnome";
    hyprland.enable = config.desktop.environment == "hyprland";
    plasma.enable = config.desktop.environment == "plasma";
    nodesktop.enable = config.desktop.environment == "none";
    xfce.enable = config.desktop.environment == "xfce";
  };
}
