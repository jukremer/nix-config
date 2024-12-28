{
  xdg.configFile."ghostty/config" = {
    enable = true;
    text = # toml
      ''
        font-size = 16
        window-padding-x = 5
        window-padding-balance = true
        mouse-hide-while-typing = true
        macos-option-as-alt = left
      '';
  };

  home.sessionPath = [ "$GHOSTTY_BIN_DIR" ];
}
