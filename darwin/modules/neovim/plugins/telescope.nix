{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions.fzf-native = {
        enable = true;
        caseMode = "smart_case";
        fuzzy = true;
      };
      extensions.undo = {
        enable = true;
      };
      extensions.file_browser = {
        enable = true;
        hijackNetrw = true;
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
          desc = "Help";
        };
        "<leader>d" = {
          action = "diagnostics";
          desc = "Open diagnostic picker";
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
