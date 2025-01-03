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
        tmuxSessionizer = pkgs.writeShellScriptBin "tmuxSessionizer" ''
          if [[ $# -eq 1 ]]; then
              selected=$1
          else
              selected=$(find ~/pjx -mindepth 1 -maxdepth 1 -type d | fzf)
          fi

          if [[ -z $selected ]]; then
              exit 0
          fi

          selected_name=$(basename "$selected" | tr . _)
          tmux_running=$(pgrep tmux)

          if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
              tmux new-session -s $selected_name -c $selected
              exit 0
          fi

          if ! tmux has-session -t=$selected_name 2> /dev/null; then
              tmux new-session -ds $selected_name -c $selected
          fi

          tmux switch-client -t $selected_name
        '';
      in
      ''
        bindkey -s '^f' ' . ${lib.getExe tmuxSessionizer}\n';
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



