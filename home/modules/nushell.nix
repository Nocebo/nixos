{pkgs-unstable, ...}: {
  programs.nushell = {
    enable = true;
    package = pkgs-unstable.nushell;
    settings = {
      show_banner = false;
      buffer_editor = "code";
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
  programs.carapace = {
    enable = true;
    package = pkgs-unstable.carapace;
    enableNushellIntegration = true;
  };
  programs.starship = {
    enable = true;
    package = pkgs-unstable.starship;
    enableNushellIntegration = true;
  };
}
