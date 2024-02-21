{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [ "~/.config/alacritty/catppuccin-macchiato.toml" ];

      shell = {
        program = "/etc/profiles/per-user/jan/bin/fish";
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 16;
      };

      window = {
        padding = {
          x = 6;
          y = 6;
        };
        dynamic_padding = true;
        decorations = "Full";
        decorations_theme_variant = "Dark";
        blur = true;
        opacity = 0.999;
      };

      colors = {
        transparent_background_colors = true;
      };

      mouse = {
        hide_when_typing = true;
      };

      env = {
        TERM = "alacritty";
      };
    };
  };
}
