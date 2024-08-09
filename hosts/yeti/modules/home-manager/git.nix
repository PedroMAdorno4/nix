{
  programs.git = {
    enable = true;
    userName = "Pedro Adorno";
    userEmail = "pedroadorno99@gmail.com";
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
    };
  };
}
