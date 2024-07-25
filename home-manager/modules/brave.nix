{ pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # dark reader
      { id = "nffaoalbilbmmfgbnbgppjihopabppdk"; } # video speed controller
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # sponsor block
      { id = "dnhpnfgdlenaccegplpojghhmaamnnfp"; } # augmented steam
      { id = "apmmpaebfobifelkijhaljbmpcgbjbdo"; } # stylus
      { id = "ponfpcnoihfmfllpaingbgckeeldkhle"; } # enhancer for youtube 
      #{ id = ""; } #
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
      "--hide-crash-restore-bubble"
      "--restore-last-session"
    ];
  };
}
