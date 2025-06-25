{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "Hyprland desktop environment";
  };

  config = lib.mkIf config.hyprland.enable {
    # Enable basic Hyprland support at system level
    programs.hyprland = {
      enable = true;
      xwayland.enable = true; #applications access to xorg libraries
      withUWSM = true;
    };

    environment.defaultPackages = with pkgs; [
      kitty
      rofi
    ];
    # Set environment variables for Nvidia to get Hyprland working
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    services.udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

    # # Enable XDG portals - important for screen sharing and file dialogs
    # services.dbus.enable = true; # Required for portals
    # xdg.portal = {
    #   enable = true;
    #   extraPortals = [pkgs.xdg-desktop-portal-gtk];
    # };
  };
}
