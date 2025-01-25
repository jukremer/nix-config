{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.writeShellScriptBin "ghostty-mock" "true"; # Installed using Homebrew
    enableZshIntegration = true;
    settings = {
      font-size = 16;
      window-padding-x = 5;
      window-padding-balance = true;
      mouse-hide-while-typing = true;
      macos-option-as-alt = "left";
    };
  };
}
