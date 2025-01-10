{ config, osConfig, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    zprof.enable = false;
    defaultKeymap = "emacs";

    shellAliases = {
      rb = ''git -C "$FLAKE" add -A && nh os switch'';
      upg = ''git -C "$FLAKE" add -A && nh os switch -u'';

      dev = ''nix develop "$FLAKE" --command zsh'';
      s = "kitten ssh";
      v = "nvim";

      conf = "nvim $FLAKE/hosts/${osConfig.networking.hostName}/configuration.nix";
      pkgs = "nvim $FLAKE/hosts/${osConfig.networking.hostName}/modules/nixos/packages.nix";

      ll = "ls -lh";
    };

    initExtra =
      let
        projectFinder = pkgs.writeShellScriptBin "projectFinder" ''
          if [[ $# -eq 1 ]]; then
              selected=$1
          else
              selected=$(find ~/pjx -mindepth 1 -maxdepth 1 -type d | ${pkgs.fzf}/bin/fzf)
          fi

          if [[ $selected ]]; then
            cd "$selected" || exit
          fi
        '';
      in
      ''
        bindkey -s '^f' ' . ${lib.getExe projectFinder}\n';
        bindkey "^$terminfo[kRIT5]" forward-word
        bindkey "^$terminfo[kLFT5]" backward-word
      '';

    history = {
      size = 9999;
      save = 9999;
      path = "${config.xdg.dataHome}/zsh/history";
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    # Disable this vanilla functionality
    # because we are using antidote to load
    # these plugins since its much faster
    enableCompletion = false;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = false;

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



