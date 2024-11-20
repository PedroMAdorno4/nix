{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (import ../../../../modules/nixos/scripts/terminal.nix { inherit "pkgs"; })
    brave
    yazi
    gcc
    fastfetch
    unzip
    zip
    lazygit
    lazydocker
    xwayland
    wl-clipboard
    hyprland
    waybar
    home-manager
    pamixer
    wlogout
    vim
    kitty
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
    mako
    killall
    neofetch
    transmission_4-gtk
    (callPackage ../../../../modules/packages/bibata-hyprcursor/default.nix { baseColor = "#FFFFFF"; outlineColor = "#000000"; watchBackgroundColor = "#FFFFFF"; })
    (callPackage ../../../../modules/packages/nix-node.nix { inherit pkgs; })
    trackma
    busybox
    devbox
    bun # for ags
    nix-index
    vulkan-tools
    amdgpu_top
    ydotool
    libreoffice-qt6-fresh
    comma
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
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
