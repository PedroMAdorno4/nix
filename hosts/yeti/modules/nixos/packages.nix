{
  pkgs,
  unstable-pkgs,
  ...
}: let
  stablePackages = with pkgs; [
    (import ../../../../modules/nixos/scripts/terminal.nix {inherit "pkgs";})
    (callPackage ../../../../modules/packages/nix-node.nix {inherit pkgs;})
    (callPackage ../../../../modules/packages/zen.nix {inherit pkgs;})
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
    pyprland
    toybox
    mangohud
    hyprpolkitagent
    uwsm
    heroic
    quickemu
    spice
    spice-gtk
    magic-wormhole
    input-leap
    youtube-music
    xdg-utils
    bambu-studio
  ];

  unstablePackages = with unstable-pkgs; [
    bottles
  ];

  customPackages = [
  ];
in {
  environment.systemPackages = stablePackages ++ unstablePackages ++ customPackages;

  fonts.packages = with pkgs;
    [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      twemoji-color-font
    ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
