{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.nodesktop = {
    enable = mkEnableOption "No desktop environment";
  };
  config = lib.mkIf config.nodesktop.enable {
    #services.xserver.enable = false;
  };
}
