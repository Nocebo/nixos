{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    desktop.plasma = lib.mkEnableOption "Plasma desktop environment";
  };
  config = lib.mkIf config.desktop.plasma {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the Plasma 6 Desktop Environment.
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
  };
}
