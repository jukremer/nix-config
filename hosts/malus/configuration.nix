{ inputs, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.agenix.darwinModules.default
    ../../modules/darwin
  ];

  ## Set username and home directory (required by home-manager)
  users.users.jan = {
    name = "jan";
    home = "/Users/jan";
  };
  networking.hostName = "malus";

  nix = {
    enable = false;
    ## Recommended for nixd
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "jan"
        "@admin"
      ];
    };
    # gc.automatic = true;
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jan = import ../../modules/home-manager;
    extraSpecialArgs = {
      inherit inputs;
    };
    backupFileExtension = "backup";
  };

  homebrew = {
    enable = true;
    onActivation = {
      upgrade = true;
      cleanup = "zap";
    };
  };

  programs = {
    zsh.enable = true;
    fish.enable = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "left";
        mru-spaces = false;
        largesize = 64;
        magnification = false;
        # persistent-apps = [
        #   "/Applications/Safari.app"
        #   "/System/Applications/Mail.app"
        #   "/System/Applications/Calendar.app"
        #   "/Applications/Things3.app"
        #   "/Applications/Ghostty.app"
        #   "/Applications/Obsidian.app"
        #   "/System/Applications/Preview.app"
        #   "/Applications/NetNewsWire.app"
        #   "/System/Applications/Music.app"
        #   "/System/Applications/Books.app"
        #   "/System/Applications/System Settings.app"
        # ];
      };
      finder = {
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        _FXShowPosixPathInTitle = true;
      };
      # screencapture.location = "~/Pictures/Bildschirmfotos";
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    ## Set Git commit hash for darwin-version.
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    ## Used for backwards compatibility, please read the changelog before changing.
    ## $ darwin-rebuild changelog
    stateVersion = 4;
  };
}
