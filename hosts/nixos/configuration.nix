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
  openssh.enable = true;
  openssh.mode = "soft"; # Unsafe SSH for development
  desktop.gnome = true; # Enable GNOME desktop environment
  desktop.stylix = true; # Enable Stylix theme and icon pack
  virt.docker = true; # Enable Docker container management
  boot.grub = true; # Enable GRUB bootloader
  virt.qemu = true; # Enable virtualization support
  net.tailscale = true; # Enable Tailscale networking

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
