{
  programs.nixvim = {
    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [ ];
      };

      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        luaLib = true;
        nvimRuntime = true;
        plugins = true;
      };
    };

  };
}
