{
  lib,
  pkg,
  ...
}: {
  nix.settings.auto-optimise-store = true;

  nix.gc.automatic = true;
  nix.gc.dates = "weekly"; # Run garbage collection every week
  nix.gc.options = "--delete-older-than 30d"; # Delete generations older than 30 days

  boot.loader.systemd-boot.configurationLimit = 10; # Keep the last 10 boot entries

  #  TODO: Make it work with flakes
  #  This does nothing because of flakes. Needs this to work,
  # flake = "github:yourusername/dotfiles#yourHostname";
  # flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
  # # Update the system with non breaking changes
  # system.autoUpgrade = {
  #   enable = true;
  #   allowReboot = true; # Allow automatic reboots if necessary
  #   dates = "5d"; # Check for updates daily
  # };
}
