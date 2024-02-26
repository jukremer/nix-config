{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "/etc/profiles/per-user/jan/bin/fish";
    clock24 = true;
    mouse = true;
    keyMode = "vi";
    terminal = "xterm-256color";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60'
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @plugin 'catppuccin/tmux'
          set -g @catppuccin_flavour 'macchiato'
          set -g @catppuccin_powerline_icons_theme_enabled on
          set -g @catppuccin_l_left_separator ""
          set -g @catppuccin_l_right_separator ""
          set -g @catppuccin_r_left_separator ""
          set -g @catppuccin_r_right_separator ""
          # set -g @catppuccin_pill_theme_enabled on
        '';
      }
    ];
  };
}
