{
  config,
  lib,
  ...
}: {
  options = {
    tailscale = lib.mkEnableOption "Enable Tailscale networking";
  };

  config = lib.mkIf config.tailscale {
    services.tailscale = {
      enable = true;
    };
  };
}
