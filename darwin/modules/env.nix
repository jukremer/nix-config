{ config, ... }:
{
  home.sessionVariables = {
    DIRENV_LOG_FORMAT = "";
    LEDGER_FILE = "${config.xdg.dataHome}/hledger.journal";
    CLICOLOR = 1;
    LS_COLORS = "$(vivid generate catppuccin-macchiato)";
  };
}
