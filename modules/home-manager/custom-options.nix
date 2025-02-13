{lib, ...}: {
  options.home.musicPlayerMpris = lib.mkOption {
    type = lib.types.str;
    description = "The player name as reported by `playerctl --list-all`";
  };
  options.home.musicPlayerExecutable = lib.mkOption {
    type = lib.types.str;
    description = "The executable to run when the system starts, for example";
  };
}
