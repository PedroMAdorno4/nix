{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Pedro Adorno";
    userEmail = "pedro.adorno@liven.tech";

    signing = {
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };

    extraConfig = {
      rerere = {
        enabled = true;
      };
      maintenance = {
        auto = false;
        strategy = "incremental";
      };
      rebase = {
        updateRefs = true;
      };
      commit = {
        gpgSign = true;
      };
      gpg = {
        format = "ssh";
      };

      core = let
        gitignore = pkgs.writeText "gitignore" ''
          .direnv
          .devenv
          .envrc
          devenv.nix
          .devenv*
          devenv*
          devbox.json
          devbox.lock
          .devbox
          nohup.out
          .idea
          .vscode
          __pycache__
          node_modules
          *.pyc
          *.pyo
          *.swp
          Session.vim
        '';
      in {
        excludesFile = "${gitignore}";
      };
    };
  };
}
