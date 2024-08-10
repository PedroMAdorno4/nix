{ config, osConfig, pkgs, lib, ... }: {
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

      conf = "nvim $FLAKE/hosts/${osConfig.networking.hostName}/configuration.nix";
      pkgs = "nvim $FLAKE/hosts/${osConfig.networking.hostName}/packages.nix";

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
        bindkey -s '^f' '. ${lib.getExe projectFinder}\n';
      '';

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



