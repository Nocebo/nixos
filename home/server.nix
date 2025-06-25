{pkgs, ...}: {
  imports = [
    ./modules
    ./editor
  ];

  home.packages = with pkgs; [
    curl
  ];

  # Self made options
  noeditor = true;

  # Keep on all?
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.11";
}
