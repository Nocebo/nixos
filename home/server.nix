{pkgs, ...}: {
  imports = [
    ./modules
    ./editor
  ];

  home.packages = with pkgs; [
    curl
    duckdb
  ];

  # Self made options
  editor.none = true;

  # Keep on all?
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
