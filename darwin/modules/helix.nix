{ pkgs, ... }:
{
  programs.helix = {

    enable = true;

    extraPackages = [
      pkgs.marksman
      pkgs.nodePackages.prettier
      pkgs.typst-lsp
      pkgs.typstfmt
    ];

    settings = {

      theme = "catppuccin_macchiato";

      editor = {

        line-number = "relative";
        cursorline = true;
        color-modes = true;
        rulers = [ 80 ];
        shell = [
          "fish"
          "-c"
        ];
        mouse = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        indent-guides = {
          render = true;
        };

        soft-wrap = {
          enable = true;
        };

        statusline = {

          left = [
            "mode"
            "spinner"
            "version-control"
            "file-modification-indicator"
          ];

          center = [ "file-name" ];

          right = [
            "diagnostics"
            "selections"
            "position"
            "position-percentage"
            "file-encoding"
            "file-type"
          ];

          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
      };

      keys = {
        normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
      ];
    };
  };
}
