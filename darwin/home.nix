{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./modules/env.nix

    ./modules/alacritty.nix
    ./modules/alias.nix
    ./modules/bat.nix
    ./modules/fish/default.nix
    ./modules/git/default.nix
    ./modules/helix.nix
    ./modules/kitty.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/zellij.nix
    ./modules/zsh/default.nix
  ];

  home.username = "jan";
  home.homeDirectory = "/Users/jan";

  home.stateVersion = "23.11";

  xdg.enable = true;

  programs = {

    home-manager.enable = true;

    btop = {
      enable = true;
      settings = {
        color_theme = "~/.config/btop/themes/catppuccin_macchiato.theme";
        theme_background = false;
      };
    };

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
      enableAliases = true;
      git = true;
      icons = true;
    };

    fzf = {
      enable = true;
      colors = {
        "bg+" = "#363a4f";
        "bg" = "#24273a";
        "spinner" = "#f4dbd6";
        "hl" = "#ed8796";
        "fg" = "#cad3f5";
        "header" = "#ed8796";
        "info" = "#c6a0f6";
        "pointer" = "#f4dbd6";
        "marker" = "#f4dbd6";
        "fg+" = "#cad3f5";
        "prompt" = "#c6a0f6";
        "hl+" = "#ed8796";
      };
    };

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
      settings = {
        default-key = "20AF0A659F2B93AD918415D1A7DA689CB3B078EC";
        keyserver = "hkps://keys.openpgp.org";
      };
    };

    jq = {
      enable = true;
    };

    nushell = {
      enable = true;
    };

    pandoc = {
      enable = true;
    };

    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (
        exts: [
          exts.pass-otp
          exts.pass-update
        ]
      );
      settings = {
        PASSWORD_STORE_DIR = "~/.local/share/pass/";
      };
    };

    ripgrep = {
      enable = true;
      arguments = [ "--ignore-case" ];
    };

    ssh = {
      enable = true;
    };

    yt-dlp = {
      enable = true;
      extraConfig = ''-o "$HOME/Movies/Videos/%(title)s.%(ext)s" -S "res:1080" '';
    };

    zoxide = {
      enable = true;
    };
  };

  home.packages = with pkgs; [ ];
}
