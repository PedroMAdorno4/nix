{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden
      {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";} # dark reader
      {id = "nffaoalbilbmmfgbnbgppjihopabppdk";} # video speed controller
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # sponsor block
      {id = "dnhpnfgdlenaccegplpojghhmaamnnfp";} # augmented steam
      {id = "apmmpaebfobifelkijhaljbmpcgbjbdo";} # stylus
      {id = "ponfpcnoihfmfllpaingbgckeeldkhle";} # enhancer for youtube
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";} # vimium
      {id = "kekjfbackdeiabghhcdklcdoekaanoel";} # mal-sync
      #{ id = ""; } #
    ];
    commandLineArgs = [
      "--ozone-platform=wayland"
      "--use-angle=vulkan"
      "--enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,VaapiVideoEncoder,VaapiVideoDecodeLinuxGL"
      "--disable-features=WebRtcAllowInputVolumeAdjustment,UseChromeOSDirectVideoDecoder,UseSkiaRenderer"
      "--ignore-gpu-blocklist"
      "--enable-wayland-ime"
      "--hide-crash-restore-bubble"
      "--restore-last-session"
      "--password-store=basic"
    ];
  };
}
