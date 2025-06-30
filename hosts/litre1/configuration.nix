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
  ];

  services.cron = {
    enable = true;
    systemCronJobs = [
      {
        name = "nasua-update";
        command = "bash /home/kleanzy/nasua/main.sh";
        user = "kleanzy";
        # schedule for hourly updates
        schedule = "0 * * * *";
      }
    ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
