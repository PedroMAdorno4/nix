{
  programs.nixvim.plugins.luasnip = {
    enable = true;
    fromSnipmate = [
      {paths = ../snippets;}
    ];
  };

  programs.nixvim.plugins.cmp_luasnip = {
    enable = true;
  };
}
