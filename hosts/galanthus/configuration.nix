{ inputs, pkgs, ... }:
{
  imports = [
    inputs.agenix.nixosModules.default
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "galanthus";
    networkmanager.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ "jan" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  users.users.jan = {
    isNormalUser = true;
    description = "Jan Kremer";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services = {
    openssh.enable = true;
  };

  programs = {
    git.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  environment.systemPackages = [
    pkgs.yt-dlp
    pkgs.spotdl
    pkgs.ffmpeg
  ];

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";

  system.stateVersion = "23.11"; # Don't change!
}
