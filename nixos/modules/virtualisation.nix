{ pkgs, ... }: {
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    shutdownTimeout = 60;
    qemu.package = pkgs.qemu_kvm;
  };
}
