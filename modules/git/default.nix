{
  programs = {

    git = {
      enable = true;
      userName = "Jan Kremer";
      userEmail = "mail@jankremer.eu";
      ignores = import ./ignore.nix;
      extraConfig = {
        merge.conflictstyle = "zdiff3";
        commit.verbose = true;
        help.autocorrect = 10;
        diff.algorithm = "histogram";
        user.signingkey = "0xA7DA689CB3B078EC";
      };
    };

    gh = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };
  };
}
