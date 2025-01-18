{ pkgs, unstable-pkgs, ... }:
let
  stablePackages = with pkgs; [
    (import ../../../../modules/nixos/scripts/terminal.nix { inherit "pkgs"; })
    brave
    yazi
    gcc
    fastfetch
    unzip
    zip
    lazygit
    lazydocker
    wl-clipboard
    hyprland
    waybar
    home-manager
    pamixer
    wlogout
    vim
    pavucontrol
    git
    playerctl
    wofi
    wofi-emoji
    slurp
    grim
    swappy
    hyprpicker
    hyprlock
    ncspot
    mpv
    zathura
    mpvpaper
    parted
    steam
    steamcmd
    ripgrep
    fzf
    fd
    wlprop
    vesktop
    socat
    jq
    libnotify
    killall
    neofetch
    transmission_4-gtk
    (callPackage ../../../../modules/packages/nix-node.nix { inherit pkgs; })
    trackma
    busybox
    devbox
    vulkan-tools
    amdgpu_top
    ydotool
    libreoffice-qt6-fresh
    wl-gammarelay-rs
    util-linux
    exfat
    ntfs3g
    sad
    delta
    p7zip
    filezilla
    godot_4
    goxel
    blender
    bottles
    rustc
    cargo
    popsicle
    timg
    pyprland
  ];

  unstablePackages = with unstable-pkgs; [
    lutris
  ];
in
{
  environment.systemPackages = stablePackages ++ unstablePackages;


  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    nerdfonts
  ];
}
