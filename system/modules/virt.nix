{
  config,
  lib,
  pkgs,
  ...
}: {
  options.virt.qemu = lib.mkEnableOption "Virtualization support";

  config = lib.mkIf config.virt.qemu {
    environment.systemPackages = with pkgs; [
      # virt-manager is a desktop application for managing virtual machines.
      # virt-manager

      # qemu-kvm is the QEMU full system emulator and virtualizer.
      qemu_kvm

      # libvirt provides the virtualization API.
      libvirt

      # virt-viewer is a lightweight viewer for virtual machine consoles.
      virt-viewer

      #virtualbox
    ];
    # programs.virt-manager.enable = true;

    users.groups.libvirtd.members = ["kleanzy"];
    users.users.kleanzy.extraGroups = ["libvirtd"];

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;

    #virtualisation.virtualbox.host.enable = true;
  };
}
