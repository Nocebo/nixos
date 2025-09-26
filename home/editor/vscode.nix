{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: {
  options = {
    editor.vscode = lib.mkEnableOption "vscode editor";
  };

  config = lib.mkIf config.editor.vscode {
    home.packages = [
      pkgs-unstable.nixd # Alternative Nix language server
      pkgs-unstable.alejandra # Formatter
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
