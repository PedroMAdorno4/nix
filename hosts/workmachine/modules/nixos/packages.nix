{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (import ../../../../modules/nixos/scripts/terminal.nix { inherit pkgs; })
    (callPackage ../../../../modules/packages/nix-node.nix { inherit pkgs; })
    (callPackage ../../../../modules/packages/tmux-sessionizer.nix { inherit pkgs; })
    brave
    yazi
    gcc
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
    parted
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
    gotop
    busybox
    devbox
    slack
    openvpn
    beekeeper-studio
    nix-index
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
    brightnessctl
    quickemu
    spice
    spice-gtk
    bottles
    qutebrowser
    timg
    teams-for-linux
    woeusb
    transmission_4-gtk
    wf-recorder
    pyprland
    hyprpolkitagent
    uwsm
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
  ]
  ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
