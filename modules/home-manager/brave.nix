{ pkgs, ... }: {
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
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } #
      #{ id = ""; } #
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
      "--enable-wayland-ime"
      "--hide-crash-restore-bubble"
      "--restore-last-session"
      "--password-store=basic"
    ];
  };
}
