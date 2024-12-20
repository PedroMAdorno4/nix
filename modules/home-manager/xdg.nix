{
  xdg = {
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "image/png" = [ "timg.desktop" ];
      "image/jpeg" = [ "timg.desktop" ];
      "image/jpg" = [ "timg.desktop" ];
      "image/webp" = [ "timg.desktop" ];
      "image/gif" = [ "timg.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/mp4" = [ "mpv.desktop" ];
      "text/plain" = [ "nvim.desktop" ];
      "inode/directory" = [ "yazi.desktop" ];
    };
  };
}
