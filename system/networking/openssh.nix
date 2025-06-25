{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    softOpenssh = lib.mkEnableOption "Enable unsafe OpenSSH server";
    hardenedOpenssh = lib.mkEnableOption "Enable safe OpenSSH server";
  };

  config = lib.mkMerge [
    (lib.mkIf config.softOpenssh {
      services.openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "yes";
          PasswordAuthentication = true;
        };
      };

      # open ports for ssh
      networking.firewall.allowedTCPPorts = [22];

      #TODO: Understand if this is needed to do nixos-rebuild over ssh
      nix.settings.trusted-users = ["root" "kleanzy"]; # Add your username
      nix.settings.require-sigs = false;
    })

    (lib.mkIf config.hardenedOpenssh {
      services.openssh = {
        enable = true;
        ports = [9922];
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = false;
        };
      };

      # open ports for ssh
      #networking.firewall.allowedTCPPorts = [9922]; # A different port than 22 is safer

      #TODO: Understand if this is needed to do nixos-rebuild over ssh
      nix.settings.trusted-users = ["root" "kleanzy"]; # Add your username
      nix.settings.require-sigs = false;
    })
  ];
}
