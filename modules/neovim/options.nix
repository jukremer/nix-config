{
  programs.nixvim = {
    globals = { };

    clipboard = {
      register = "unnamedplus";
    };

    options = {
      number = true;
      relativenumber = true;

      mouse = "a";

      showmode = false;

      breakindent = true;

      undofile = true;

      signcolumn = "yes";
      colorcolumn = "80";

      updatetime = 250;
      timeoutlen = 300;

      splitright = true;
      splitbelow = true;

      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };

      inccommand = "split";

      cursorline = true;

      scrolloff = 5;

      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      termguicolors = true;

      linebreak = true;
      conceallevel = 1;
    };
  };
}
