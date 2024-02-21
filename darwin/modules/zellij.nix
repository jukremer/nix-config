{ config, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "fish";
      theme = "catppuccin-mocha";
      default_layout = "compact";
      copy_command = "pbcopy";
      layout_dir = "${config.xdg.dataHome}/zellij";
    };
  };
}
