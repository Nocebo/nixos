{
  config,
  lib,
  ...
}: {
  options.enableDocker = lib.mkEnableOption "Enable Docker";
  config = lib.mkIf config.enableDocker {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
}
