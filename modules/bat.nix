{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-macchiato";
    };
    extraPackages = with pkgs.bat-extras; [
      batgrep
      batman
      batpipe
      batwatch
      batdiff
      prettybat
    ];
    themes = {
      Catppuccin-macchiato = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = null;
        };
        file = "Catppuccin-macchiato.tmTheme";
      };
    };
  };
}
