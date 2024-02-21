{
  programs.fish = {
    enable = true;
    shellAbbrs = import ./abbrs.nix;
    functions = import ./functions.nix;
    interactiveShellInit = ''
      set -g fish_greeting
      fish_vi_key_bindings
      fish_vi_cursor
      set fish_cursor_default block
      set fish_cursor_insert line
      set fish_cursor_replace_one underscore
      set fish_cursor_visual block
      set -gx CLICOLOR 1
      set -gx LS_COLORS (vivid generate catppuccin-macchiato)
    '';
  };
}
