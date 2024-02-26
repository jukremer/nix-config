{
  programs.nixvim = {
    options.completeopt = [
      "menu"
      "menuone"
      "noselect"
    ];

    plugins = {
      luasnip.enable = true;

      nvim-cmp = {
        enable = true;
        autoEnableSources = true;

        snippet.expand = "luasnip";

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = {
            action = "cmp.mapping.select_prev_item()";
            modes = [
              "i"
              "s"
            ];
          };
          "<Tab>" = {
            action = "cmp.mapping.select_next_item()";
            modes = [
              "i"
              "s"
            ];
          };
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };
  };
}
