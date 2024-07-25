{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8"];
  };

  environment.systemPackages = with pkgs; [
    (import ./scripts/terminal.nix { inherit pkgs; })
    brave
    yazi
    nodejs
    python
    go
    gcc
    fastfetch
    unzip
    zip
    lazygit
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
    nh
    steam
    steamPackages.steamcmd
    ripgrep
    fzf
    wlprop
    vesktop
    socat
    jq
    libnotify
    mako
    killall
    neofetch
    pulseaudio
    (callPackage ../packages/koreader.nix {})
    
    # GPU stuff
    amdvlk
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
