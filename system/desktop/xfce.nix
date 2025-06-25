{ pkgs,
  config,
  lib,
  inputs,
  ...}:{
  options = {
    xfce.enable = lib.mkEnableOption "xfce desktop environment";
  };
  config = lib.mkIf config.xfce.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.xfce.enable = true;
};
}
