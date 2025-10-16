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
  ];

  environment.systemPackages = with pkgs; [
    #home-manager
    git
    #signal-desktop
  ];
}
