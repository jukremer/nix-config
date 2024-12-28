{ config, pkgs, ... }:
{
  imports = [
    ./colors.nix
    ./git
    ./gui
    ./helix.nix
    ./packages.nix
    ./shell
  ];

  home = {
    username = "jan";
    homeDirectory = "/Users/jan";
    stateVersion = "24.05";

    ## Mute login message in terminal
    file.".hushlogin".text = "";

    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
      LEDGER_FILE = "${config.xdg.dataHome}/ledger/2024.journal";
      PASSAGE_DIR = "${config.xdg.dataHome}/passage/store";
      PASSAGE_IDENTITIES_FILE = "${config.xdg.dataHome}/passage/identities";
    };

    shellAliases = {
      "yt" = "yt-dlp";
      "yta" = "yt-dlp -x";
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      videos = "${config.home.homeDirectory}/Movies/Videos";
    };
  };

  xdg.configFile."gopass/config" = {
    enable = true;
    text = # toml
      ''
        [mounts]
        path = ~/.local/share/pass
      '';
  };

  programs = {
    home-manager.enable = true;

    gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
      settings = {
        default-key = "20AF0A659F2B93AD918415D1A7DA689CB3B078EC";
        keyserver = "hkps://keys.openpgp.org";
      };
    };

    pandoc.enable = true;

    password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (
        exts: with exts; [
          pass-audit
          # pass-import
          pass-otp
          pass-update
        ]
      );
      settings = {
        PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";
      };
    };

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
      extraConfig = ''
        UseKeychain yes
        IdentityFile ~/.ssh/id_ed25519
        SetEnv TERM=xterm-256color
      '';
    };

    yt-dlp = {
      enable = true;
      settings = {
        output = "${config.xdg.userDirs.videos}/%(title)s.%(ext)s";
        format-sort = "res:1080";
        audio-quality = 0;
        sponsorblock-mark = "default";
        embed-metadata = true;
        embed-thumbnail = true;
        xattrs = true;
      };
    };
  };
}
