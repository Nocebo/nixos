{
  config,
  lib,
  ...
}: {
  options.virt.docker = lib.mkEnableOption "Enable Docker";
  config = lib.mkIf config.virt.docker {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
    };
  };
}
