{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [

      {
        key = "<Space>";
        action = "<NOP>";
        mode = "n";
      }

      {
        key = "<esc>";
        action = ":noh<CR>";
        mode = "n";
        options = {
          desc = "Escape to reset highlight";
          silent = true;
        };
      }

      {
        key = "Y";
        action = "y$";
        mode = "n";
        options = {
          desc = "Fix Y behavior";
          silent = true;
        };
      }

      {
        key = "<leader>s";
        action = ":w<CR>";
        mode = "n";
        options = {
          desc = "Save file";
        };
      }

      {
        key = ">";
        action = ">gv";
        mode = "v";
        options = {
          desc = "Better indenting";
          silent = true;
        };
      }

      {
        key = "<";
        action = "<gv";
        mode = "v";
        options = {
          desc = "Better indenting";
          silent = true;
        };
      }

      {
        key = "<TAB>";
        action = ">gv";
        mode = "v";
        options = {
          desc = "Better indenting";
          silent = true;
        };
      }

      {
        key = "<S-TAB>";
        action = "<gv";
        mode = "v";
        options = {
          desc = "Better indenting";
          silent = true;
        };
      }

      {
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        mode = "v";
        options = {
          desc = "Move visual selection up";
          silent = true;
        };
      }

      {
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        mode = "v";
        options = {
          desc = "Move visual selection down";
          silent = true;
        };
      }
    ];
  };
}
