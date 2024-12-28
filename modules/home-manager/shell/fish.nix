{
  programs.fish = {
    enable = true;

    interactiveShellInit = # fish
      ''
        set fish_greeting
        set fish_vi_key_bindings
        set fish_vi_cursor

        eval $(/opt/homebrew/bin/brew shellenv fish)
      '';

    shellAbbrs = {
      gs = "git status";
      gc = "git commit";
      gca = "git commit -a";
      gcaa = "git commit -a --amend";
      gco = "git checkout";
    };
  };
}
