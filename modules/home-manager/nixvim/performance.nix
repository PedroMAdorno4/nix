{
  programs.nixvim = {
    performance.combinePlugins = {
      enable = true;

      standalonePlugins = [
        # "otter"
      ];
    };
  };
}
