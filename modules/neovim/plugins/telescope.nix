{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions = {
        fzf-native = {
          enable = true;
          caseMode = "smart_case";
          fuzzy = true;
        };
        undo = {
          enable = true;
        };
        file_browser = {
          enable = true;
          hijackNetrw = true;
        };
        ui-select = {
          enable = true;
        };
      };

      keymaps = {
        "<leader>f" = {
          action = "find_files";
          desc = "Open file picker";
        };
        "<leader>/" = {
          action = "live_grep";
          desc = "Global search in workspace folder";
        };
        "<leader>b" = {
          action = "buffers";
          desc = "Open buffer picker";
        };
        "<leader>h" = {
          action = "help_tags";
          desc = "Search help";
        };
        "<leader>d" = {
          action = "diagnostics";
          desc = "Open diagnostic picker";
        };
        "<leader>'" = {
          action = "resume";
          desc = "Open last picker";
        };
        "<leader>?" = {
          action = "keymaps";
          desc = "Open command palette";
        };

        # Additions LSP mappings
        "gd" = {
          action = "lsp_definitions";
          desc = "Goto definitions";
        };
        "gt" = {
          action = "lsp_type_definitions";
          desc = "Goto definitions";
        };
        "gr" = {
          action = "lsp_references";
          desc = "Goto references";
        };
        "gi" = {
          action = "lsp_implementations";
          desc = "Goto implementations";
        };
        "<leader>s" = {
          action = "lsp_document_symbols";
          desc = "Open symbol picker";
        };
        "<leader>S" = {
          action = "lsp_dynamic_workspace_symbols";
          desc = "Open workspace symbol picker";
        };
      };
    };

    keymaps = [
      {
        key = "<leader>.";
        action = ":Telescope file_browser<CR>";
        options = {
          desc = "Open file browser";
          silent = true;
        };
      }

      {
        key = "<leader>u";
        action = ":Telescope undo<CR>";
        options = {
          desc = "Undo history";
          silent = true;
        };
      }
    ];
  };
}
