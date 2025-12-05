{ pkgs, ... }: {
  programs.git = {
    enable = true;

    signing = {
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "Pedro Adorno";
        email = "pedroadorno99@gmail.com";
      };
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

      core =
        let
          gitignore = pkgs.writeText "gitignore" ''
            .direnv
            .devenv
            .envrc
            .devenv*
            devenv*
            devenv.*
            devenv.lock
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
        in
        {
          excludesFile = "${gitignore}";
        };

    };
  };
}
