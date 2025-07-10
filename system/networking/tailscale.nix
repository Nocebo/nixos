{
  config,
  lib,
  ...
}: {
  options = {
    net.tailscale = lib.mkEnableOption "Enable Tailscale networking";
  };

  config = lib.mkIf config.net.tailscale {
    services.tailscale.enable = true;
  };

  # TODO this is maybe very secure, but also very restrictive
  # networking.firewall.interfaces.tailscale0.allowedTCPPorts = [ 8080 ];
}
