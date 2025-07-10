{ pkgs,
  config,
  lib,
  inputs,
  ...}:{
  options = {
    desktop.xfce = lib.mkEnableOption "xfce desktop environment";
  };
  config = lib.mkIf config.desktop.xfce {
    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.xfce.enable = true;
};
}
