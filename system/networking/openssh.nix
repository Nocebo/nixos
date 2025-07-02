{
  pkgs,
  lib,
  config,
  ...
}: {
  options.openssh = {
    enable = lib.mkEnableOption "OpenSSH server";
    
    mode = lib.mkOption {
      type = lib.types.enum ["soft" "hardened" "disabled"];
      default = "disabled";
      description = ''
        OpenSSH server configuration mode:
        - soft: Unsafe settings for development (password auth, root login)
        - hardened: Secure settings for production (key auth only, no root)
        - disabled: No SSH server
      '';
    };
  };

  config = lib.mkIf config.openssh.enable {
    services.openssh = {
      enable = true;
      
      # Port configuration
      ports = if config.openssh.mode == "hardened" then [9922] else [22];
      
      # Security settings based on mode
      settings = {
        PermitRootLogin = if config.openssh.mode == "soft" then "yes" else "no";
        PasswordAuthentication = config.openssh.mode == "soft";
      };
    };

    # Firewall configuration
    networking.firewall.allowedTCPPorts = 
      if config.openssh.mode == "soft" then [22]
      else if config.openssh.mode == "hardened" then [] # Commented out in original
      else [];

    # Development settings (only for soft mode)
    nix.settings = lib.mkIf (config.openssh.mode == "soft") {
      trusted-users = ["root" "kleanzy"];
      require-sigs = false;
    };
    
    # Production settings (for hardened mode)
    nix.settings = lib.mkIf (config.openssh.mode == "hardened") {
      trusted-users = ["root" "kleanzy"];
      require-sigs = false;
    };
  };
}
