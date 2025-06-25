qemu-system-x86_64 \
  -enable-kvm \
  -m 2048 \
  -smp 2 \
  -drive file=./vm/nixos.qcow2,format=qcow2 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device e1000,netdev=net0 \
  -virtfs local,path=/nix/store,security_model=none,mount_tag=nix-store \
  -display default

