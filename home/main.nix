{pkgs, ...}: {
  imports = [
    ./modules
    ./editor
    ./desktop
    ./conf/dconf.nix
  ];

  home.packages = [
    pkgs.google-chrome
    pkgs.obsidian
    pkgs.dbeaver-bin
    pkgs.discord
    pkgs.superfile
    pkgs.tree
    pkgs.coreutils
    pkgs.htop
    pkgs.duckdb
    pkgs.fastfetch
  ];

  editor.vscode = true;

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
