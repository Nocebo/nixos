{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ns = "sudo nixos-rebuild switch ";
      nb = "sudo nixos-rebuild build ";
      hs = "home-manager switch ";
      hb = "home-manager build ";
      nvs = "nix run github:nix-community/nixos-generators -- --format qcow";
      gs = "git status";
      nxr = "nix run";
    };
    initExtra = ''
      PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
      PS1='\[\e[2m\]\A\[\e[0m\] \[\e[38;5;40m\]\u\[\e[0m\]@\[\e[38;5;39m\]\h\[\e[0m\] \[\e[2m\]\w\[\e[0m\] ''${PS1_CMD1} \[\e[2m\]>\[\e[0m\] '
    '';
  };
}
