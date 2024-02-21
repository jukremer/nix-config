{
  programs.nixvim = {
    globals = { };

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";
    };

    options = {
      updatetime = 250;
      timeoutlen = 300;

      relativenumber = true;
      number = true;
      scrolloff = 4;
      conceallevel = 1;
      showmode = false;

      mouse = "nv";

      hlsearch = true;

      # incsearch = true;
      # inccommand = "split";
      ignorecase = true;
      smartcase = true;
      splitright = true;
      splitbelow = true;

      signcolumn = "yes";
      colorcolumn = "80";
      termguicolors = true;
      linebreak = true;

      breakindent = true;

      undofile = true;

      # exrc = true;
    };
  };
}
