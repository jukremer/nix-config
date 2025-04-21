{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./colors.nix
    ./ghostty.nix
    ./git
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
    };

    shellAliases = {
      "yt" = "yt-dlp";
      "yta" = "yt-dlp -x";
    };

    packages = [ inputs.agenix.packages.${pkgs.system}.default ];
  };

  xdg = {
    enable = true;
    userDirs = {
      videos = "${config.home.homeDirectory}/Movies/Videos";
    };
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
