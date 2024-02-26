{
  programs.kitty = {
    enable = true;
    # darwinLaunchOptions = [  "--single-instance"  "--directory=/tmp/my-dir"  "--listen-on=unix:/tmp/my-socket"];
    theme = "Catppuccin-Macchiato";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 16;
    };

    settings = {
      shell = "/etc/profiles/per-user/jan/bin/fish";

      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";

      window_padding_width = 6;
      macos_titlebar_color = "background";
      mouse_hide_wait = -1;
      cursor_blink_interval = 0;
    };

    keybindings = {
      "cmd+shift+t" = "new_tab";
      "cmd+t" = "new_tab_with_cwd";
    };
  };
}
