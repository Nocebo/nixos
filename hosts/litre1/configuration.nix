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
  networking.hostName = "litre1";

  # User modules
  softOpenssh = true; # Enable unsafe OpenSSH server
  desktop.environment = "none"; # Disable desktop environment
  enableDocker = true; # Enable Docker container management
  enableStylix = false; # Enable Stylix theme and icon pack
  bootSystemd = true; # Enable systemd-boot bootloader
  tailscale = true; # Enable Tailscale networking

  environment.defaultPackages = with pkgs; [
    htop
    tree
    ripgrep
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
