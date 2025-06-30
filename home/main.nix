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
    pup
    ranger
    miller
    jq
    bc
    python3
    python3Packages.pip
    python3Packages.virtualenv
    python3Packages.requests
    python3Packages.pandas
    python3Packages.numpy
    #beatuifulsoup4
    python3Packages.beautifulsoup4
    python3Packages.ipykernel
    (perl.withPackages (ps: with ps; [HTMLParser]))
  ];
  # Self made options
  vscode.enable = true;

  # Keep on all?
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.11";
}
