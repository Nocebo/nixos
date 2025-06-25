{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./user.nix
    ./localization.nix
    ./cleanup.nix
    ./virt.nix
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    git
  ];
}
