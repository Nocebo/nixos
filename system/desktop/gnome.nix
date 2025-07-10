{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    desktop.gnome = lib.mkEnableOption "GNOME desktop environment";
  };

  config = lib.mkIf config.desktop.gnome {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # services.displayManager.gdm.enable = true;
    # services.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
      dconf2nix
      gnomeExtensions.tiling-shell
      gnomeExtensions.rounded-window-corners-reborn
    ];
  };
}
