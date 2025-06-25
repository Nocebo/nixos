{
  config,
  lib,
  ...
}: {
  options = {
    k3s.enable = lib.mkEnableOption "Enable k3s";
    k3s.role = lib.mkOption {
      type = lib.types.enum ["agent" "server"];
      default = "agent";
      description = "The role of the k3s node (agent or server)";
    };
  };

  config = lib.mkIf config.k3s.enable {
    services.k3s = {
      enable = true;
      role = config.k3s.role;
    };

    networking.firewall = {
      allowedTCPPorts = [22 6443];
      allowedUDPPorts = [8472];
    };
  };
}
