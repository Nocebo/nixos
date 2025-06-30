{pkgs, ...}: {
  imports = [
    ./modules
    ./editor
  ];

  home.packages = with pkgs; [
    curl
    duckdb
    pup
    ranger
    miller
    jq
    bc
    (perl.withPackages (ps: with ps; [HTMLParser]))
  ];

  # Self made options
  noeditor.enable = true;

  # Keep on all?
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.11";
}
