{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["quatro"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
