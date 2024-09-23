{
  programs.nixvim = {
    performance.combinePlugins = {
      enable = true;

      standalonePlugins = [
        # "sad"
        # "otter"
      ];
    };
  };
}
