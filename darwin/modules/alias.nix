{
  home.shellAliases = {
    ":q" = "exit";
    "backupdocs" = "rsync -a ~/Documents/ /Volumes/Jans Übergangslösung/Documents";
    "backupmusic" = "rsync -a ~/Music/ /Volumes/Jans Übergangslösung/Musik";
    "capscreen" = "ffmpeg -f avfoundation -i '1:1'";
    "cat" = "bat";
    "find" = "fd";
    "grep" = "rg";
    "lg" = "lazygit";
    "mv" = "mv -i";
    "rm" = "trash";
    "top" = "btop";
    "tree" = "lt";
    "vi" = "nvim";
    "vim" = "nvim";
    "yt" = "yt-dlp";
    "yta" = "yt-dlp -x --audio-quality 0 --embed-thumbnail --xattrs --audio-format m4a";
    "zz" = "z -";
  };
}
