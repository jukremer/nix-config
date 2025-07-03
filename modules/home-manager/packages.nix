{ pkgs, ... }:
{
  home.packages = with pkgs; [
    darwin.trash
    curl
    nh
    cachix
    hledger
    hledger-web
    ffmpeg
    imagemagick

    # Work
    codex
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
}
