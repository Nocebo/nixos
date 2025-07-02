{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../system # System-wide configuration modules
  ];
  networking.hostName = "nixos";

  # User modules
  softOpenssh = true; # Enable unsafe OpenSSH server
  desktop.environment = "gnome"; # Disable desktop environment
  enableStylix = true; # Enable Stylix theme and icon pack
  enableDocker = true; # Enable Docker container management
  bootGrub = true; # Enable GRUB bootloader
  virt = true; # Enable virtualization support
  tailscale = true; # Enable Tailscale networking
  devshells.rust = true; # Enable Rust development environment

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
