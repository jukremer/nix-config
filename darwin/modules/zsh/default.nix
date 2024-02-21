{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    defaultKeymap = "viins";
    autocd = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      function lk { cd "$(walk --icons "$@")" }
      source ${config.xdg.configHome}/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    envExtra = import ./env.nix;
    history = {
      path = "${config.xdg.stateHome}/zsh/zsh_history";
      extended = true;
    };
  };
}
