{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [

      # Reset search highlight with <esc>
      {
        key = "<esc>";
        action = "<cmd>nohlsearch<CR>";
        mode = "n";
        options = {
          desc = "Escape to reset highlight";
          silent = true;
        };
      }

      # Better split navigation
      {
        key = "<C-h>";
        action = "<C-w><C-h>";
        mode = "n";
        options = {
          desc = "Move focus to the left window";
          silent = true;
        };
      }
      {
        key = "<C-l>";
        action = "<C-w><C-l>";
        mode = "n";
        options = {
          desc = "Move focus to the right window";
          silent = true;
        };
      }
      {
        key = "<C-j>";
        action = "<C-w><C-j>";
        mode = "n";
        options = {
          desc = "Move focus to the lower window";
          silent = true;
        };
      }
      {
        key = "<C-k>";
        action = "<C-w><C-k>";
        mode = "n";
        options = {
          desc = "Move focus to the upper window";
          silent = true;
        };
      }

      # Disable arrow keys
      {
        key = "<left>";
        action = "<cmd>echo 'Use h to move!'<CR>";
        mode = "n";
        options = {
          desc = "Use h to move!";
          silent = true;
        };
      }
      {
        key = "<right>";
        action = "<cmd>echo 'Use l to move!'<CR>";
        mode = "n";
        options = {
          desc = "Use l to move!";
          silent = true;
        };
      }
      {
        key = "<up>";
        action = "<cmd>echo 'Use k to move!'<CR>";
        mode = "n";
        options = {
          desc = "Use k to move!";
          silent = true;
        };
      }
      {
        key = "<down>";
        action = "<cmd>echo 'Use j to move!'<CR>";
        mode = "n";
        options = {
          desc = "Use j to move!";
          silent = true;
        };
      }
    ];
  };
}
