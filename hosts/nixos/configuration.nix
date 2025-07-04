{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../system/modules # Never remove, contains user
    ../../system/networking
    ../../system/containers
    ../../system/boot
    ../../system/desktop
  ];
  networking.hostName = "nixos";

  # User modules
  softOpenssh = true; # Enable unsafe OpenSSH server
  desktop.environment = "gnome"; # Disable desktop environment
  enableStylix = true; # Enable Stylix theme and icon pack
  enableDocker = false; # Enable Docker container management
  bootGrub = true; # Enable GRUB bootloader
  virt = false; # Enable virtualization support
  tailscale = true; # Enable Tailscale networking

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
