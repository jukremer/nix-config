{
  programs.nixvim = {

    autoGroups = {
      highlight-yank = {
        clear = true;
      };

      numbers = {
        clear = true;
      };

      default = {
        clear = true;
      };
    };

    autoCmd = [

      # Relative numbers in normal mode, absolute numbers in insert mode
      {
        desc = "Set absolute numbers when entering insert mode";
        event = "InsertEnter";
        group = "numbers";
        command = "set norelativenumber";
      }
      {
        desc = "Set relative numbers when leaving insert mode";
        event = "InsertLeave";
        group = "numbers";
        command = "set relativenumber";
      }

      # Open file on position of last edit
      {
        desc = "Open file on position of last edit";
        event = "BufReadPost";
        command = "silent! normal! '.";
      }

      # Highlight on yank
      {
        desc = "Highlight on yank";
        event = "TextYankPost";
        group = "highlight-yank";
        callback = {
          __raw = "function() vim.highlight.on_yank() end";
        };
      }

      # Enable spellcheck in text files
      {
        desc = "Enable spellcheck in text files";
        event = "FileType";
        pattern = [
          "tex"
          "latex"
          "typst"
          "markdown"
        ];
        command = "setlocal spell spelllang=de,en";
      }
    ];
  };
}
