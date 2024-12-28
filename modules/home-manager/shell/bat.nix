{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batman ];
  };

  home.shellAliases = {
    "cat" = "bat";
    "man" = "batman";
  };
}
