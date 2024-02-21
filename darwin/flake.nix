{
  description = "Darwin configuration for Jans Computer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      home-manager,
      nixvim,
      nixpkgs,
      ...
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # Set username and home directory (required by home-manager)
          users.users.jan = {
            name = "jan";
            home = "/Users/jan";
          };
          # List packages installed in system profile. To search by name, run:
          # nix search nixpkgs ...
          environment.systemPackages = import ./modules/packages.nix pkgs;

          environment.variables = {
            EDITOR = "nvim";
          };

          homebrew = {
            enable = true;
            onActivation = {
              upgrade = true;
              cleanup = "zap";
            };
            taps = [
              "homebrew/autoupdate"
              "homebrew/bundle"
              "homebrew/cask-fonts"
              "homebrew/core"
              "homebrew/services"
            ];
            casks = import ./modules/homebrew/casks.nix;
            masApps = import ./modules/homebrew/mas.nix;
          };

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;
          nix.package = pkgs.nix;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Create /etc/zshrc that loads the nix-darwin environment.
          programs.zsh.enable = true; # default shell on catalina
          programs.fish.enable = true;

          system.defaults = {
            dock = {
              autohide = true;
              autohide-delay = 0.0;
              autohide-time-modifier = 0.0;
              orientation = "left";
              mru-spaces = false;
              largesize = 64;
              magnification = false;
              # dashboard-in-overlay = true;
            };
            finder = {
              AppleShowAllExtensions = true;
              FXPreferredViewStyle = "clmv";
              ShowPathbar = true;
              _FXShowPosixPathInTitle = true;
            };
            # screencapture.location = "~/Pictures/Screenshots";
          };

          system.keyboard = {
            enableKeyMapping = true;
            remapCapsLockToEscape = true;
          };

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 4;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "x86_64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Jans-Computer
      darwinConfigurations."Jans-Computer" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jan = import ./home.nix;
            };
          }
          nixvim.nixDarwinModules.nixvim
          ./modules/neovim/default.nix
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Jans-Computer".pkgs;
      formatter.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.nixfmt-rfc-style;
    };
}
