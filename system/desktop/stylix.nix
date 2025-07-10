{
  pkgs,
  lib,
  config,
  ...
}: {
  options.desktop.stylix = lib.mkEnableOption "Stylix, a GTK theme and icon pack";

  config = lib.mkIf config.desktop.stylix {
    stylix = {
      enable = true;
      autoEnable = true;
      homeManagerIntegration = {
        autoImport = true; # This will automatically import stylix in Home Manager
        followSystem = true; # This ensures Home Manager follows system-wide settings
      };
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

      fonts = {
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        monospace = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
