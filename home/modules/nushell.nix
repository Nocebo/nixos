{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    settings = {
      show_banner = false;
      buffer_editor = "code";
      completions.algorithm = "fuzzy";
    };
    shellAliases = {
      ns = "sudo nixos-rebuild switch ";
      nb = "sudo nixos-rebuild build ";
      hs = "home-manager switch ";
      hb = "home-manager build ";
      nvs = "nix run github:nix-community/nixos-generators -- --format qcow";
      gs = "git status";
      nxr = "nix run";
    };
  };
  # yazi: A modern terminal file manager.
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableNushellIntegration = true;
  };

  # # broot: A tree-view file manager for the terminal.
  # programs.broot = {
  #   enable = true;
  #   package = pkgs.broot;
  #   enableNushellIntegration = true;
  # };

  # carapace: A cross-shell command completion engine.
  programs.carapace = {
    enable = true;
    package = pkgs.carapace;
    enableNushellIntegration = true;
  };

  # starship: A minimal, customizable prompt for any shell.
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    enableNushellIntegration = true;
  };
}
