{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_status"
        "$git_metrics"
        "$git_state"
        "$nodejs"
        "$rust"
        "$golang"
        "$python"
        "$typst"
        "$gleam"
        "$fill"
        "$nix_shell"
        "$shell"
        "$line_break"
        "$character"
      ];

      fill = {
        symbol = " ";
      };

      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](blue)";
      };

      directory = {
        style = "blue";
      };

      git_branch = {
        format = "[$branch(:$remote_branch)](white) ";
      };

      git_status = {
        style = "cyan";
      };

      nodejs = {
        symbol = "nodejs";
        format = "[$symbol ($version )](green)";
      };

      rust = {
        symbol = "rust";
        format = "[$symbol ($version )](red)";
      };

      python = {
        symbol = "python";
        format = "[$symbol ($version )](yellow)";
      };

      golang = {
        symbol = "go";
        format = "[$symbol ($version )](green)";
      };

      typst = {
        symbol = "typst";
        format = "[$symbol ($version )](green)";
      };

      gleam = {
        symbol = "gleam";
        format = "[$symbol ($version )](purple)";
      };

      nix_shell = {
        symbol = "nix";
        heuristic = true;
        format = "[$symbol ($state $name )](red)";
      };

      shell = {
        disabled = false;
        fish_indicator = "fish ";
        format = "[$indicator](purple)";
      };
    };
  };
}
