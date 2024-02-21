{
  programs.nixvim = {
    plugins = {
      gitsigns = {
        enable = true;
      };

      fugitive = {
        enable = true;
      };

      neogit = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "<leader>g";
        action = ":Neogit<CR>";
        mode = "n";
        options = {
          desc = "Git";
          silent = true;
        };
      }
    ];
  };
}
