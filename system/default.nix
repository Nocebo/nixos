{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./modules
    ./networking
    ./containers
    ./boot
    ./desktop
    ./services
    ./devshells
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    git
  ];
}
