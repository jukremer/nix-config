{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    atkinson-hyperlegible
    jetbrains-mono
    open-sans
  ];
  homebrew.casks = [
    "font-chomsky"
    "font-cormorant-garamond"
    "font-crimson-text"
    "font-new-york"
    "font-sf-compact"
    "font-sf-mono"
    "font-sf-pro"
    "font-unifrakturmaguntia"
  ];
}
