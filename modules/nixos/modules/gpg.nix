{pkgs, ...}: {
  # Use “RSA and RSA” with 4096 bits keysize
  # $ gpg2 --full-generate-key
  #
  # Add the key to Github as a GPG key from:
  # $ gpg2 --list-keys case@sensitive.email | grep pub
  # $ gpg2 --armor --export keyID
  #
  # Verify if it works:
  # $ touch test.tmp && gpg2 -sea -r case@sensitive.email test.tmp

  services.openssh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
