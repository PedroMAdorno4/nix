{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Pedro Adorno";
    userEmail = "pedroadorno99@gmail.com";

    signing = {
      key = null; # GnuPG decides what signing key to use depending on commit’s author details
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
