{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      markdown-oxide
      nixd
      nixfmt-rfc-style
    ];

    settings = {
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        mouse = true;

        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "warning";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        soft-wrap.enable = true;

        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
            "read-only-indicator"
            "file-modification-indicator"
          ];

          center = [ "file-name" ];

          right = [
            "diagnostics"
            "selections"
            "register"
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
          X = [
            "extend_line_up"
            "extend_to_line_bounds"
          ];
        };
      };
    };

    languages = {
      language-server = {
        tinymist.command = "tinymist";
        nixd = {
          command = "nixd";
          config = {
            formatting.command = [ "nixfmt" ];
            nixpkgs.expr = "import (builtins.getFlake \"~/.config/nix\").inputs.nixpkgs { }";
            options = {
              nixos.expr = "(builtins.getFlake \"~/.config/nix\").nixosConfigurations.galanthus.options";
              darwin.expr = "(builtins.getFlake \"~/.config/nix\").darwinConfigurations.malus.options";
              home-manager.expr = "(builtins.getFlake \"~/.config/nix\").homeConfigurations.jan.options";
            };
          };
        };
      };

      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
          formatter.command = "nixfmt";
          auto-format = true;
        }
        {
          name = "typst";
          language-servers = [ "tinymist" ];
          formatter.command = "typstyle";
          auto-format = true;
        }
      ];
    };
  };
}
