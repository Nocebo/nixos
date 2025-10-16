{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./vscode.nix
    ./zed.nix
    ./noeditor.nix
    ./nvim.nix
  ];

  # options.graphical.editor = lib.mkOption {
  #   type = lib.types.enum ["zed" "vscode" "none"];
  #   default = "zed";
  #   description = "Desktop environment to enable";
  # };

  # config = {
  #   zed.enable = config.graphical.editor == "zed";
  #   vscode.enable = config.graphical.editor == "vscode";
  #   noeditor.enable = config.graphical.editor == "none";
  # };
}
