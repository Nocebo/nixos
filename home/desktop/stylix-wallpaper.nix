{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    #inputs.stylix.homeModules.stylix
    inputs.home-manager.homeModules.home-manager
  ];
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/seti.yaml";
    image = ./genetrix.jpg;
    polarity = lib.mkForce "dark";
    gnome = {
      enable = true;
      useWallpaper = true;
    };
  };
}
