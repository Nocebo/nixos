{
  inputs,
  lib,
  config,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    #"${modulesPath}/installer/scan/not-detected.nix"
    #./disko.nix
    ./hardware-configuration.nix
    ../../system # System-wide configuration modules
  ];

  nixpkgs.hostPlatform = "x86_64-linux"; # or your appropriate system architecture

  networking.hostName = "vm";

  # User modules
  openssh.enable = true;
  openssh.mode = "soft"; # Unsafe SSH for development
  desktop.none = true; # Disable desktop environment
  desktop.stylix = true; # Enable Stylix theme and icon pack
  virt.docker = true; # Enable Docker container management
  boot.grub = true; # Enable GRUB bootloader

  # Enable sway
  programs.sway = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Add any additional packages you want to install system-wide
    wget
    vim
    htop
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}
