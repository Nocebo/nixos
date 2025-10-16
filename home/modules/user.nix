{
  pkgs,
  inputs,
  config,
  ...
}: {
  home = {
    username = "kleanzy";
    homeDirectory = "/home/kleanzy";
  };
  programs.git = {
    enable = true;
    userEmail = "nomail@localhost.gg";
    userName = "Nocebo";
  };
}
