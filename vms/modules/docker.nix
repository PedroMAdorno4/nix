{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    liveRestore = true;
    enableOnBoot = false;
  };

  environment.systemPackages = with pkgs; [
    git
  ];
}
