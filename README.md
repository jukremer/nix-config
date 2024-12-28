# Floccus

## Mac setup

### Installation

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
git clone git@github.com:jukremer/nix-config.git ~/.confin/nix
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
nix run nix-darwin -- switch --flake ~/.config/nix
```

### Switch

```sh
darwin-rebuild switch --flake ~/.config/nix
```

### Update

```sh
nix flake update --commit-lock-file ~/.config/nix
```

## NixOS setup

### Installation

```sh
git clone git@github.com:jukremer/nix-config.git ~/.confin/nix
```

### Switch

```sh
sudo nixos-rebuild switch --flake ~/.config/nix
```

### Update

```sh
nix flake update --commit-lock-file ~/.config/nix
```
