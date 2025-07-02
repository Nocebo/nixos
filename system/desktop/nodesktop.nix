{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    desktop.none = lib.mkEnableOption "No desktop environment";
  };
  config = lib.mkIf config.desktop.none {
    #services.xserver.enable = false;
  };
}
