{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      indent = true;
    };

    # Home Manager treesitter injections
    hmts.enable = true;
  };
}
