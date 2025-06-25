{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    zed.enable = lib.mkEnableOption "zed editor";
  };

  config = lib.mkIf config.zed.enable {
    home.packages = with pkgs; [
      nixd
    ];
    programs.zed-editor = {
      enable = true;
      extensions = ["nix" "dockerfile" "HTML" "SQL" "docker-compose" "mermaid" "pkl"];
      # userSettings =
      # {
      #   theme = "Gruvbox Dark Hard";
      # };
    };
  };
}
