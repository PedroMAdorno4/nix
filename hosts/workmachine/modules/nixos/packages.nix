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
    (callPackage ../../../../modules/packages/nix-node.nix { inherit pkgs; })
    gotop
    busybox
    devbox
    slack
    openvpn
    beekeeper-studio
    nix-index
    bun # for ags
    bruno
    google-cloud-sdk
    wl-gammarelay-rs
    sad
    delta
    ntfs3g
    popsicle
    epson-escpr
    epson-escpr2
    gnumake
    gnome-clocks
    brightnessctl
    quickemu
    spice
    spice-gtk
    bottles
    qutebrowser
    timg
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
