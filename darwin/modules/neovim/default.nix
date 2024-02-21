{
  imports = [
    ./autocmd.nix
    ./cmp.nix
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    filetype.extension.typ = "typst";

    # highlight.ExtraWhitespace.bg = "red";
    # match.ExtraWhitespace = "\\s\\+$";
  };
}
