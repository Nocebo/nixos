{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system/modules # Never remove, contains user
    ../../system/networking
    ../../system/containers
    ../../system/boot
    ../../system/desktop
  ];
  networking.hostName = "apple";

  # User modules
  hardenedOpenssh = true; # Enable unsafe OpenSSH server
  desktop.environment = "none"; # Disable desktop environment
  enableDocker = true; # Enable Docker container management
  enableStylix = false; # Enable Stylix theme and icon pack
  bootSystemd = true; # Enable systemd-boot bootloader

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
