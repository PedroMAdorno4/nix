{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (import ../../../../modules/nixos/scripts/terminal.nix { inherit "pkgs"; })
    brave
    yazi
    gcc
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
    parted
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
    pulseaudio
    (callPackage ../../../../modules/packages/bibata-hyprcursor/default.nix { baseColor = "#FFFFFF"; outlineColor = "#000000"; watchBackgroundColor = "#FFFFFF"; })
    (callPackage ../../../../modules/packages/nix-node.nix { inherit pkgs; })
    gotop
    busybox
    devbox
    slack
    openvpn
    wireshark
    beekeeper-studio
    nix-index
    bun # for ags
    bruno
    comma
    libreoffice-qt6-fresh
    kooha
    google-cloud-sdk
    wl-gammarelay-rs
    code-cursor
    sad
    delta
    teams-for-linux
    ntfs3g
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
