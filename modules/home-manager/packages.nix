{ inputs, pkgs, ... }:
{
  home = {
    shellAliases."rm" = "trash";
    packages = [
      inputs.agenix.packages.${pkgs.system}.default
      pkgs.age
      pkgs.cachix
      pkgs.curl
      pkgs.darwin.trash
      pkgs.ditaa
      pkgs.ffmpeg
      pkgs.gopass
      pkgs.hayagriva
      pkgs.hledger
      pkgs.hledger-web
      pkgs.imagemagick
      pkgs.passage
      pkgs.plantuml
      pkgs.rsync
      pkgs.spotdl
      pkgs.typst
      pkgs.wget
    ];
  };
}
