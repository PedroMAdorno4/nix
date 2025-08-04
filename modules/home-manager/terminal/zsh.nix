{
  config,
  osConfig,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    zprof.enable = false;
    defaultKeymap = "emacs";

    shellAliases = {
      rb = ''git -C "$NH_FLAKE" add -A && nh os switch -- --accept-flake-config'';
      upg = ''git -C "$NH_FLAKE" add -A && nh os switch -u -- --accept-flake-config'';

      dev = ''nix develop "$NH_FLAKE" --command zsh'';
      s = "kitten ssh";
      v = "nvim";

      conf = "nvim $NH_FLAKE/hosts/${osConfig.networking.hostName}/configuration.nix";
      pkgs = "nvim $NH_FLAKE/hosts/${osConfig.networking.hostName}/modules/nixos/packages.nix";
      dcl = "docker compose logs";
      dclf = "docker compose logs -f";
      dcd = "docker compose down";
      dcu = "docker compose up";
      dcb = "docker compose build";
      dcud = "docker compose up -d";
      dl = "docker compose logs";
      dlf = "docker compose logs -f";
      dcs = "docker compose ps";

      ll = "ls -lah";
    };

    initContent = let
      projectFinder = pkgs.writeShellScriptBin "projectFinder" ''
        if [[ $# -eq 1 ]]; then
            selected=$1
        else
            selected=$(find ~/pjx ~/3dp/ -mindepth 1 -maxdepth 1 -type d | ${pkgs.fzf}/bin/fzf)
        fi

        if [[ $selected ]]; then
          cd "$selected" || exit
        fi
      '';
    in ''
      bindkey -s '^f' ' . ${lib.getExe projectFinder}\n';
      bindkey "^$terminfo[kRIT5]" forward-word
      bindkey "^$terminfo[kLFT5]" backward-word

      if uwsm check may-start && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi

      eval "$(direnv hook zsh)"
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
