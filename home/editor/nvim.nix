{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    editor.nvim = lib.mkEnableOption "nvim editor";
  };
  config = lib.mkIf config.editor.nvim {
    programs.neovim = {
      enable = true;
      extraConfig = ''
      '';
      plugins = with pkgs.vimPlugins; [
        lazy-nvim
      ];
    };
  };
}
