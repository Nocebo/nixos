# Nixos, flake, homemanager
Using [Misterio77](https://github.com/Misterio77/nix-starter-configs/blob/main/README.md)

```nix flake init -t github:misterio77/nix-starter-config#minimal```

# Using VM's
```
nixos-rebuild switch --flake .#vm --target-host kleanzy@localhost --use-remote-sudo
```
Apparently you can opt into virtualization nix files. Did not get this to work though
```bash
nixos-generate --flake .#vm -I nixos-generators=./vm-format.nix -f qcow
```
# Remote server config from another host
```bash
nixos-rebuild switch --flake .#litre1 --target-host litre1 --sudo --ask-sudo-password
```
It's good to build it before
```bash
nixos-rebuild build --flake .#litre1
```

# Theming
stylix
https://base16-showcase.vercel.app/ for base16 premades

# Configs
This is the best way to do it tbh
```nix
{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    HERE.enable = lib.mkEnableOption "HERE";
  };

  config = lib.mkIf config.HERE.enable {
  # config
  };
```
And in the configuration.nix, use
```nix
HERE.enable = true;
```
This is an alternative but it is annoying.

```nix
{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
  #FIXME
  ];
options.<NAME>.<ME> = lib.mkOption {
  type = lib.types.enum ["HERE"];
  default = "HERE";
  description = "Desk HERE";
```nix
};

config = {
  HERE.enable = config.desktop.environment == "HERE";
};
```
# Todo
