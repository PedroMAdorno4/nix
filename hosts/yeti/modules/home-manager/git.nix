{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Pedro Adorno";
    userEmail = "pedroadorno99@gmail.com";

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

      core =
        let
          gitignore = (pkgs.writeText "gitignore" ''
            .direnv
            .envrc
            devbox.json
            devbox.lock
            nohup.out
            .idea
            .vscode
            __pycache__
            node_modules
            *.pyc
            *.pyo
            *.swp
          '');
        in
        {
          excludesFile = "${gitignore}";
        };
    };
  };
}
