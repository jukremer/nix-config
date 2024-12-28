{ config, ... }:
{
  programs.zsh = {
    enable = true;
    # enableVteIntegration = true;
    dotDir = ".config/zsh";
    history = {
      path = "${config.xdg.stateHome}/zsh/zsh_history";
      extended = true;
    };
    autosuggestion.enable = true;
    autocd = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "cursor"
        "brackets"
        "root"
      ];
    };
    initExtra = # sh
      ''
        eval "$(/opt/homebrew/bin/brew shellenv)"

        setopt COMPLETE_IN_WORD
        setopt ALWAYS_TO_END
        setopt PATH_DIRS
        setopt AUTO_MENU
        setopt AUTO_LIST
        setopt MENU_COMPLETE
      '';

    completionInit = # sh
      ''
        autoload -U compinit && compinit
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
      '';
  };
}
