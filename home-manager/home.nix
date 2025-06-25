{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules
    ./editor
    ./conf/dconf.nix
  ];

  home = {
    username = "kleanzy";
    homeDirectory = "/home/kleanzy";
    packages = with pkgs; [
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
  };

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userEmail = "nomail@localhost.gg";
    userName = "Nocebo";
  };

  home.sessionVariables = {
    GIT_EDITOR = "code --wait";
  }; # this does not work

  # home.file = {
  #   ".zed/settings.json".source = ./conf/zed-settings.json;
  #   #"hypr/hyprland.conf".source = ./conf/hyprland.conf;
  # };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
