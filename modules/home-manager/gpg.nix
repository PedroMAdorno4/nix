{pkgs, ...}: {
  programs.gpg.enable = true;
  programs.gpg.settings = {
    no-autostart = true;
  };
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    extraConfig = ''
      allow-preset-passphrase
    '';
  };
  home.file.".pam-gnupg".source =
    pkgs.runCommand ".pam-gnupg"
    {
      keys = [
        "5CB560713868BACCB0AC53D0E3BD6763DEE6FE09"
      ];
    } "for k in $keys; do echo \"$k\" >> file;done;sort file > $out";
}
