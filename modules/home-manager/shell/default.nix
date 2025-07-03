{
  imports = [
    ./bat.nix
    # ./fish.nix
    ./starship.nix
    ./zsh.nix
  ];

  home.shellAliases = {
    "deploy" =
      "ssh -t galanthus 'cd ~/.config/nix; git pull --rebase; sudo nixos-rebuild switch --flake ~/.config/nix'";
    "mv" = "mv -i";
    "rm" = "trash";
    "tree" = "lt";
    "zz" = "z -";
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        warn_timeout = "1m";
        hide_env_diff = true;
      };
    };

    eza = {
      enable = true;
      git = true;
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
      fileWidgetCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
      fileWidgetOptions = [ "--preview 'bat --color=always {}'" ];
    };

    fd.enable = true;

    ripgrep = {
      enable = true;
      arguments = [ "--ignore-case" ];
    };

    zoxide.enable = true;
  };
}
