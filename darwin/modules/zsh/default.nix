{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    defaultKeymap = "viins";
    enableAutosuggestions = true;
    autocd = true;
    dirHashes = {
      docs = "$HOME/Documents";
      vids = "$HOME/Videos";
      dl = "$HOME/Downloads";
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "cursor"
        "brackets"
      ];
      styles = import ./syntax-highlight.nix;
    };
    initExtra = ''
      function lk { cd "$(walk --icons "$@")" }
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';
    envExtra = import ./env.nix;
    history = {
      path = "${config.xdg.stateHome}/zsh/zsh_history";
      extended = true;
    };
  };
}
