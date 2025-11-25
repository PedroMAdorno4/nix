{ pkgs, ... }:
let
  browsers = "firefox.desktop";
  terminals = "kitty.desktop";
  file-managers = [ "yazi.desktop" ];
  image-viewers = "timg.desktop";
  text-editors = "nvim.desktop";
  video-players = "mpv.desktop";
  pdf-viewers = "org.pwmt.zathura.desktop";

  associations = {
    # terminal
    "x-scheme-handler/terminal" = terminals;

    # web
    "x-scheme-handler/https" = browsers;
    "x-scheme-handler/http" = browsers;
    "x-scheme-handler/about" = browsers;
    "x-scheme-handler/unknown" = browsers;
    "text/html" = browsers;

    # files
    "inode/directory" = file-managers;

    # pictures
    "image/*" = image-viewers;

    # videos
    "video/*" = video-players;

    # text
    "text/*" = text-editors;
    "application/x-*script" = text-editors;
    "application/yaml" = text-editors;
    "application/json" = text-editors;

    # pdf
    "application/pdf" = pdf-viewers;
  };

in

{
  home.packages = [
    pkgs.handlr-regex
    (pkgs.writeShellScriptBin "xdg-open" ''handlr open "$@"'')
    (pkgs.writeShellScriptBin "xterm" "handlr launch x-scheme-handler/terminal -- \"$@\"")
  ];

  xdg.mimeApps = {
    enable = true;
    associations.added = associations;
    defaultApplications = associations;
  };

  xdg.configFile = {
    "handlr/handlr.toml".text =
      ''
        enable_selector = true
        selector = "walker -d -k -p 'Open with:'"
        term_exec_args = '-e'
        expand_wildcards = true
      '';
  };

}
