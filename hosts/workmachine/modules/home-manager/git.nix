{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Pedro Adorno";
    userEmail = "pedro.adorno@liven.tech";
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
      core =
        let
          gitignore = (pkgs.writeText "gitignore" ''
            .direnv
            .envrc
            .idea
            .vscode
            __pycache__
            node_modules
            *.pyc
            *.pyo
            *.swp
            devbox.json
            devbox.lock
          '');
        in
        {
          excludesFile = "${gitignore}";
        };
    };
  };
}
