{ pkgs }:
  # Fix GIO to be able to open terminal apps with wofi - https://www.reddit.com/r/swaywm/comments/gfk3ct/wofi_term_issues/
  pkgs.writeShellScriptBin "gnome-terminal" "kitty $@"
