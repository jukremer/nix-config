{ pkgs, ... }:
{
  imports = [
    ./comment.nix
    ./git.nix
    ./harpoon.nix
    ./lsp.nix
    ./lualine.nix
    ./telescope.nix
    ./treesitter.nix
    ./typst.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    # Set colorscheme
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.flavour = "macchiato";

    # Plugins that need no/little configuration
    plugins = {
      nvim-autopairs.enable = true;
      indent-blankline.enable = true;
      surround.enable = true;
      undotree.enable = true;

      # Hex colors show as real color
      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      conform-nvim = {
        enable = true;
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 500;
        };
        formattersByFt = {
          nix = [ "nixfmt" ];
          "_" = [ "trim_whitespace" ];
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [ vim-sleuth ];
  };
}
