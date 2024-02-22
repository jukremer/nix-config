{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      keymapsSilent = true;

      keymaps = {
        addFile = "<leader>a";
        toggleQuickMenu = "<leader>0";
        navNext = "<leader>*";
        navPrev = "<leader>#";
        navFile = {
          "1" = "<leader>1";
          "2" = "<leader>2";
          "3" = "<leader>3";
          "4" = "<leader>4";
          "5" = "<leader>5";
          "6" = "<leader>6";
          "7" = "<leader>7";
          "8" = "<leader>8";
          "9" = "<leader>9";
        };
      };
    };
    plugins.which-key.registrations = {
      "<leader>a" = "Add file to Harpoon";
      "<leader>0" = "Open Harpoon menu";
      "<leader>*" = "Go to next Harpoon file";
      "<leader>#" = "Go to previous Harpoon file";
    };
  };
}
