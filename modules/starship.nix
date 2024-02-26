{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      add_newline = false;
      palette = "catppuccin_macchiato";
      format = ''
        $username$hostname$directory$git_branch$git_status$git_metrics$git_state$nodejs$rust$golang$python$typst$fill$direnv$nix_shell$shell
        $character
      '';

      fill = {
        symbol = " ";
      };

      directory = {
        style = "blue";
      };

      character = {
        success_symbol = "[❯](pink)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      git_branch = {
        style = "subtext0";
        format = "[$branch(:$remote_branch)]($style) ";
      };

      git_status = {
        style = "sky";
      };

      nodejs = {
        symbol = "NodeJS";
        style = "green";
        format = "[$symbol ($version)]($style)";
      };

      rust = {
        symbol = "rust";
        style = "peach";
        format = "[$symbol ($version)]($style)";
      };

      python = {
        symbol = "python";
        style = "yellow";
        format = "[$symbol ($version)]($style)";
      };

      golang = {
        symbol = "go";
        style = "sapphire";
        format = "[$symbol ($version)]($style)";
      };

      typst = {
        symbol = "typst";
        style = "teal";
        format = "[$symbol ($version)]($style)";
      };

      direnv = {
        style = "green";
        disabled = false;
      };

      nix_shell = {
        symbol = "nix";
        heuristic = true;
        style = "red";
        format = "[$symbol $state( ($name)) ]($style)";
      };

      shell = {
        disabled = false;
        fish_indicator = "fish";
        style = "mauve";
        format = "[$indicator]($style)";
      };

      palettes.catppuccin_macchiato = {
        rosewater = "#f4dbd6";
        flamingo = "#f0c6c6";
        pink = "#f5bde6";
        mauve = "#c6a0f6";
        red = "#ed8796";
        maroon = "#ee99a0";
        peach = "#f5a97f";
        yellow = "#eed49f";
        green = "#a6da95";
        teal = "#8bd5ca";
        sky = "#91d7e3";
        sapphire = "#7dc4e4";
        blue = "#8aadf4";
        lavender = "#b7bdf8";
        text = "#cad3f5";
        subtext1 = "#b8c0e0";
        subtext0 = "#a5adcb";
        overlay2 = "#939ab7";
        overlay1 = "#8087a2";
        overlay0 = "#6e738d";
        surface2 = "#5b6078";
        surface1 = "#494d64";
        surface0 = "#363a4f";
        base = "#24273a";
        mantle = "#1e2030";
        crust = "#181926";
      };
    };
  };
}
