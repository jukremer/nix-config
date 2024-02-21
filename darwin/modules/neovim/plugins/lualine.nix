{
  programs.nixvim.plugins.lualine = {
    enable = true;

    globalstatus = false;
    iconsEnabled = false;
    componentSeparators = {
      left = "";
      right = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };

    # +-------------------------------------------------+
    # | A | B | C                             X | Y | Z |
    # +-------------------------------------------------+
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" ];
      lualine_c = [
        "diff"
        "%="
        "filename"
      ];

      lualine_x = [
        "diagnostics"
        "filetype"
      ];
    };
  };
}
