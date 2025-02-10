{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nodejs
    yarn
    python3
    poetry
    go
  ];
}
# Linux Kernel Packages
# gnumake ncurses flex bison pahole busybox kmod e2fsprogs jfsutils reiserfsprogs xfsprogs squashfs-progs btrfs-progs pcmciaUtils linuxquota ppp nfs-utils procps eudev grub mcelog iptables openssl bc sphinx

