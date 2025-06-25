{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.noeditor = {
    enable = mkEnableOption "No editor";
  };
  config = lib.mkIf config.noeditor.enable {
  };
}
