{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";

    shellAliases = {
      rb = ''git -C "$FLAKE" add -A && nh os switch'';
      upg = ''git -C "$FLAKE" add -A && nh os switch -u'';

      dev = ''nix develop "$FLAKE" --command zsh'';

      conf = "nvim $FLAKE/nixos/configuration.nix";
      pkgs = "nvim $FLAKE/nixos/packages.nix";

      ll = "ls -lh";
    };

    history = {
      size = 99999;
      save = 99999;
      path = "${config.xdg.dataHome}/zsh/history";
      share = true;
      ignoreDups = true;
      ignoreSpace = true;

    };

    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-completions"
      ];
    };
  };
}



