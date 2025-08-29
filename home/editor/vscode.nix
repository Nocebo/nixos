{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: {
  options = {
    vscode.enable = lib.mkEnableOption "vscode editor";
  };

  config = lib.mkIf config.vscode.enable {
    home.packages = [
      pkgs.nixd # Alternative Nix language server
      pkgs.alejandra # Formatter
    ];

    programs.vscode = {
      enable = true;
      package = pkgs-unstable.vscode;
      profiles = {
        default = {
          userSettings = {
            "editor.formatOnSave" = true;
            #"workbench.iconTheme" = "vscode-icons";
            "nix.enableLanguageServer" = true;
            "nix.serverPath" = "nixd";
            "nix.serverSettings.nixd.formatting.command" = ["alejandra"];
            "nix.ide.diagnostics.enable" = false;
          };
          extensions = with pkgs-unstable.vscode-extensions; [
            jnoortheen.nix-ide
            # bbenoist.Nix
          ];
        };
      };
    };
    home.sessionVariables = {
      GIT_EDITOR = "code --wait";
    };
  };
}
