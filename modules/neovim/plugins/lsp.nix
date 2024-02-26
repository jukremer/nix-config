{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>j" = {
              action = "goto_next";
              desc = "Goto next diagnostic";
            };
            "<leader>k" = {
              action = "goto_prev";
              desc = "Goto previous diagnostic";
            };
            "<leader>e" = {
              action = "open_float";
              desc = "Open float diagnostic";
            };
            "<leader>q" = {
              action = "setloclist";
              desc = "Open quickfix list";
            };
          };

          lspBuf = {
            "<leader>r" = {
              action = "rename";
              desc = "Rename symbol";
            };
            "<leader>a" = {
              action = "code_action";
              desc = "Perform code action";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "gD" = {
              action = "declaration";
              desc = "Goto declaration";
            };
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

      fidget.enable = true;
    };
  };
}
