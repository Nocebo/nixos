{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.editor = {
    none = mkEnableOption "No editor";
  };
  config =
    lib.mkIf config.editor.none {
    };
}
