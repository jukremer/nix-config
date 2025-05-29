{
  imports = [
    ./aliases.nix
    ./ignores.nix
  ];

  home.sessionVariables = {
    GITHUB_TOKEN = "$(gh auth token)";
  };

  programs = {
    git = {
      enable = true;
      userName = "Jan Kremer";
      userEmail = "mail@jankremer.eu";
      lfs.enable = true;
      difftastic.enable = true;

      extraConfig = {
        user.signingkey = "A7DA689CB3B078EC";
        credential.helper = "osxkeychain";
        merge.conflictstyle = "zdiff3";
        commit = {
          verbose = true;
          gpgsign = true;
        };
        branch.sort = "-committerdate";
        help.autocorrect = 10;
        diff = {
          algorithm = "histogram";
          colorMoved = "default";
        };
        log.date = "iso";
        rebase.autostash = true;
        rerere.enabled = true;
        push = {
          followtags = true;
          autoSetupRemote = true;
        };
      };
    };

    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };

    sapling = {
      enable = true;
      userName = "Jan Kremer";
      userEmail = "mail@jankremer.eu";
    };

    jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Jan Kremer";
          email = "mail@jankremer.eu";
        };
        signing = {
          behavior = "own";
          backend = "gpg";
        };
      };
    };
  };
}
