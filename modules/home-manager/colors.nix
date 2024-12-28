{ pkgs, ... }:
{
  # Rosé Pine Moon (https://rosepinetheme.com)
  programs = {
    helix.settings.theme = "rose_pine";

    bat = {
      config.theme = "rose-pine";
      themes.rose-pine = {
        src = pkgs.fetchFromGitHub {
          owner = "rose-pine";
          repo = "tm-theme";
          rev = "c4235f9a65fd180ac0f5e4396e3a86e21a0884ec";
          hash = "sha256-jji8WOKDkzAq8K+uSZAziMULI8Kh7e96cBRimGvIYKY=";
        };
        file = "dist/themes/rose-pine.tmTheme";
      };
    };

    fzf.colors = {
      "fg" = "#908caa";
      "bg" = "#191724";
      "hl" = "#ebbcba";
      "fg+" = "#e0def4";
      "bg+" = "#26233a";
      "hl+" = "#ebbcba";
      "border" = "#403d52";
      "header" = "#31748f";
      "gutter" = "#191724";
      "spinner" = "#f6c177";
      "info" = "#9ccfd8";
      "pointer" = "#c4a7e7";
      "marker" = "#eb6f92";
      "prompt" = "#908caa";
    };
  };

  xdg.configFile."ghostty/config" = {
    enable = true;
    text = # toml
      ''
        theme = rose-pine
        selection-background = 26233a
      '';
  };

}
