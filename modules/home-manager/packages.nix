{ pkgs, ... }:
{
  home = {
    shellAliases."rm" = "trash";
    packages = with pkgs; [
      darwin.trash
      curl
      cachix
      hledger
      hledger-web
      ffmpeg
      imagemagick

      # Work
      typst
      hayagriva
      quarto
      R
      python3
      rPackages.reticulate
      texliveFull
      plantuml
      ditaa
    ];
  };
}
