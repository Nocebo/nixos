{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system # System-wide configuration modules
  ];
  networking.hostName = "apple";

  # User modules
  openssh.enable = true;
  openssh.mode = "hardened"; # Secure SSH for production
  desktop.none = true; # Disable desktop environment
  virt.docker = true; # Enable Docker container management
  desktop.stylix = false; # Enable Stylix theme and icon pack
  boot.systemd = true; # Enable systemd-boot bootloader

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
