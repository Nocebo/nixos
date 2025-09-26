{
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./modules
    ./editor
    ./desktop
    ./conf/dconf.nix
  ];

  home.packages = [
    pkgs-unstable.google-chrome
    pkgs-unstable.obsidian
    pkgs-unstable.dbeaver-bin
    pkgs-unstable.discord
    pkgs.superfile
    pkgs.tree
    pkgs.coreutils
    pkgs.htop
    pkgs.duckdb
  ];
  # Self made options
  editor.vscode = true;

  # Keep on all?
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.11";
}
