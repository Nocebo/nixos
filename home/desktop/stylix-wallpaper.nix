{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/seti.yaml";
    image = ./genetrix.jpg;
    polarity = lib.mkForce "dark";
    targets.gnome = {
      enable = true;
      useWallpaper = true;
    };
    #targets.zed.enable = false;
    #targets.vscode.enable = true;
  };
}
