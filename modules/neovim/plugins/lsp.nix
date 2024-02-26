{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
            "<leader>e" = "open_float";
            "<leader>q" = "setloclist";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<leader>r" = "rename";
          };
        };

        servers = {
          cssls.enable = true;
          gopls.enable = true;
          html.enable = true;
          lua-ls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          nushell.enable = true;
          pylsp.enable = true;
          tailwindcss.enable = true;
          taplo.enable = true;
          templ.enable = true;
          tsserver.enable = true;
          typst-lsp.enable = true;
          yamlls.enable = true;
        };
      };
    };
  };
}
