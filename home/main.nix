{pkgs, ...}: {
  imports = [
    ./modules
    ./editor
    ./desktop
    ./conf/dconf.nix
  ];

  home.packages = with pkgs; [
    #vscode
    google-chrome
    obsidian
    nixos-generators
    dbeaver-bin
    ##docker is a systemd service, so it is not needed here
    supabase-cli
    discord
    #onlyoffice-desktopeditors
    #onlyoffice-bin_latest
    superfile
    tree
    coreutils
    htop
    duckdb
    # windsurf
    # zed-editor
  ];

  # Self made options
  vscode.enable = true;

  # Keep on all?
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.11";
}
