{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system # System-wide configuration modules
    ../../system # System-wide configuration modules
  ];
  networking.hostName = "litre1";

  # User modules
  openssh.enable = true;
  openssh.mode = "soft"; # Unsafe SSH for development
  desktop.none = true; # Disable desktop environment
  virt.docker = true; # Enable Docker container management
  desktop.stylix = false; # Enable Stylix theme and icon pack
  useboot.systemd = true; # Enable systemd-boot bootloader
  net.tailscale = true; # Enable Tailscale networking

  # Vallheim ports
  networking.firewall.allowedUDPPorts = [2456 2457 2458];

  environment.defaultPackages = with pkgs; [
    htop
    tree
    ripgrep
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
