{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8"];
  };

  environment.systemPackages = with pkgs; [
    # Fix GIO to be able to open terminal apps with wofi - https://www.reddit.com/r/swaywm/comments/gfk3ct/wofi_term_issues/
    (pkgs.writeShellScriptBin "gnome-terminal" "kitty $@")
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
    irssi
    
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
