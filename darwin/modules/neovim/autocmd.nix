{
  programs.nixvim.autoCmd = [

    {
      desc = "Set absolute numbers when entering insert mode";
      event = "InsertEnter";
      command = "set norelativenumber";
    }
    {
      desc = "Set relative numbers when leaving insert mode";
      event = "InsertLeave";
      command = "set relativenumber";
    }
    {
      desc = "Open file on position of last edit";
      event = "BufReadPost";
      command = "silent! normal! '.";
    }
    {
      desc = "Highlight on yank";
      event = "TextYankPost";
      callback = {
        __raw = "function() vim.highlight.on_yank() end";
      };
    }
    {
      desc = "Open help in vertical split";
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
    }
    {
      desc = "Remove trailing whitespaces on save";
      event = "BufWrite";
      command = "%s/\\s\\+$//e";
    }
    {
      desc = "Enable spellcheck in text files";
      event = "FileType";
      pattern = [
        "tex"
        "latex"
        "typst"
        "markdown"
      ];
      command = "setlocal spell spelllang=en,de";
    }
  ];
}
