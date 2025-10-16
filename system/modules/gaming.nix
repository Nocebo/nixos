{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    gaming.steam = lib.mkEnableOption "Steam gaming support";
  };

  config = lib.mkIf config.gaming.steam {
    # Gaming support
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      gamescopeSession.enable = true; # GameScope session for better gaming performance
    };

    # Additional gaming packages
    environment.systemPackages = with pkgs; [
      # Gaming utilities
      # gamemode
      # mangohud
      # lutris
      # protontricks
    ];
  };
}
