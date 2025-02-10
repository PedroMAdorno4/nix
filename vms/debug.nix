let
  pkgs = import <nixpkgs> {};

  debugVm = {modulesPath, ...}: {
    imports = [
      ./modules/docker.nix
      "${modulesPath}/virtualisation/qemu-vm.nix"
    ];

    # Forward the hosts's port 2222 to the guest's SSH port.
    virtualisation.forwardPorts = [
      {
        from = "host";
        host.port = 2222;
        guest.port = 22;
      }
      {
        from = "host";
        host.port = 9000;
        guest.port = 3000;
      }
      {
        from = "host";
        host.port = 9001;
        guest.port = 5000;
      }
      {
        from = "host";
        host.port = 9002;
        guest.port = 3001;
      }
    ];
    virtualisation.diskSize = 20000;
    virtualisation.memorySize = 2500;
    virtualisation.cores = 3;

    # Root user without password and enabled SSH for playing around
    networking.firewall.enable = false;
    services.openssh.enable = true;
    services.openssh.settings.PermitRootLogin = "yes";
    services.openssh.settings.PermitEmptyPasswords = "yes";
    security.pam.services.sshd.allowNullPassword = true;
    users.users.root.hashedPassword = ""; # "" means passwordless login
  };

  nixosEvaluation = pkgs.nixos [
    debugVm
  ];
in
  nixosEvaluation.config.system.build.vm
