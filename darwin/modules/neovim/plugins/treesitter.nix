{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      indent = true;
      incrementalSelection = {
        enable = true;
        keymaps = {
          # These interfere with macOS
          # initSelection = "<c-space>";
          # nodeIncremental = "<c-space>";
          # scopeIncremental = "<c-s>";
          # nodeDecremental = "<M-space>";
        };
      };
    };

    treesitter-textobjects = {
      enable = true;
      lspInterop.enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
        };
      };
      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };
      swap = {
        enable = true;
        swapNext = {
          "<leader>a" = "@parameter.inner";
        };
        swapPrevious = {
          "<leader>A" = "@parameter.inner";
        };
      };
    };
    treesitter-refactor = {
      enable = true;
      highlightDefinitions.enable = true;
    };

    # Home Manager treesitter injections
    hmts.enable = true;
  };
}
