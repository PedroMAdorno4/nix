{
  pkgs,
  inputs,
  unstable-pkgs,
  stable-pkgs,
  ...
}: let
  packages = with pkgs; [
    (import ../../../../modules/nixos/scripts/terminal.nix {inherit "pkgs";})
    (callPackage ../../../../modules/packages/nix-node.nix {inherit pkgs;})
    # inputs.zen-browser.packages."${system}".default
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
    mpv
    zathura
    mpvpaper
    parted
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
    trackma
    busybox
    devenv
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
    blender
    rustc
    cargo
    popsicle
    timg
    toybox
    mangohud
    hyprpolkitagent
    uwsm
    heroic
    quickemu
    spice
    spice-gtk
    magic-wormhole
    youtube-music
    xdg-utils
    unrar
    hydralauncher
    ergogen
    obs-studio
    inkscape
    lutris
    protonup-qt
    devtoolbox
    ffmpeg-full
    tldr

	# LSPs for nvim

  ];

  unstablePackages = with unstable-pkgs; [
    bottles
  ];
  stablePackages = with stable-pkgs; [
    freecad-wayland
  ];

  customPackages = [
  ];
in {
  environment.systemPackages = packages ++ stablePackages ++ unstablePackages ++ customPackages;

  fonts.packages = with pkgs;
    [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      twemoji-color-font
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
