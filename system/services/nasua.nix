{
  pkgs,
  lib,
  config,
  ...
}: {
  environment.defaultPackages = with pkgs; [
    miller
    jq
    pup
    bc
    wget
    (perl.withPackages (ps: with ps; [HTMLParser]))
  ];

  # systemd.timers."nasua-update" = {
  #   wantedBy = ["timers.target"];
  #   timerConfig = {
  #     OnBootSec = "1h";
  #     OnUnitActiveSec = "1h";
  #     Persistent = false;
  #     Unit = "nasua-update.service";
  #   };
  # };

  # systemd.services."nasua-update" = {
  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = "kleanzy";
  #     WorkingDirectory = "/home/kleanzy/docs/nasua";
  #     Environment = "PATH=/run/wrappers/bin:/run/current-system/sw/bin";
  #     ExecStart = "/home/kleanzy/docs/nasua/main.sh";
  #   };
  # };

  networking.firewall.allowedTCPPorts = [8080];
}
