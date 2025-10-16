{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    desktop.hyprland = lib.mkEnableOption "Hyprland desktop environment";
  };

  config = lib.mkIf config.desktop.hyprland {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };
}
