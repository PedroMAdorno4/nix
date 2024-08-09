{ config, ... }: {
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
    };
  };
}
