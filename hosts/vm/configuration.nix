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
    ../../system/modules # Never remove, contains user
    ../../system/networking
    ../../system/containers
    #../../system/boot
    ../../system/desktop
  ];

  nixpkgs.hostPlatform = "x86_64-linux"; # or your appropriate system architecture

  networking.hostName = "vm";

  # User modules
  softOpenssh = true; # Enable unsafe OpenSSH server
  desktop.environment = "none"; # Disable desktop environment
  enableStylix = true; # Enable Stylix theme and icon pack
  enableDocker = true; # Enable Docker container management
  bootGrub = true; # Enable GRUB bootloader

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
