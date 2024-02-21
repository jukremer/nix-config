{ pkgs, ... }:
{
  imports = [
    ./comment.nix
    ./git.nix
    ./harpoon.nix
    ./lsp.nix
    ./lualine.nix
    ./obsidian.nix
    ./telescope.nix
    ./treesitter.nix
    ./typst.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.flavour = "macchiato";

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
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-sleuth
      neoformat
    ];

    autoCmd = [
      {
        desc = "Format on save";
        event = "BufWritePre";
        command = "undojoin | Neoformat";
      }
    ];
  };
}
