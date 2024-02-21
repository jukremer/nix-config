# Nix configuration using Flakes

Almost all configuration is now done in Nix. Exceptions are listed in [TODO](#todo).

```
~/.config/nix
├── darwin
│  ├── flake.lock
│  ├── flake.nix
│  ├── home.nix
│  └── modules
│     ├── alacritty.nix
│     ├── alias.nix
│     ├── bat.nix
│     ├── env.nix
│     ├── fish
│     │  ├── abbrs.nix
│     │  ├── default.nix
│     │  └── functions.nix
│     ├── git
│     │  ├── default.nix
│     │  ├── gitui
│     │  │  └── theme.nix
│     │  └── ignore.nix
│     ├── helix.nix
│     ├── homebrew
│     │  ├── casks.nix
│     │  └── mas.nix
│     ├── kitty.nix
│     ├── neovim
│     │  ├── autocmd.nix
│     │  ├── cmp.nix
│     │  ├── default.nix
│     │  ├── keymaps.nix
│     │  ├── options.nix
│     │  └── plugins
│     │     ├── comment.nix
│     │     ├── default.nix
│     │     ├── git.nix
│     │     ├── harpoon.nix
│     │     ├── lsp.nix
│     │     ├── lualine.nix
│     │     ├── obsidian.nix
│     │     ├── telescope.nix
│     │     ├── treesitter.nix
│     │     ├── typst.nix
│     │     └── which-key.nix
│     ├── packages.nix
│     ├── starship.nix
│     ├── tmux.nix
│     ├── zellij.nix
│     └── zsh
│        ├── default.nix
│        └── env.nix
└── nix.conf
```

## Installation

Install Nix using the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer):

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
cd ~/.config
git clone ...
```

Install `nix-darwin`:

```sh
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```

Install `Homebrew`:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Switch to configuration

```sh
darwin-rebuild switch --flake ~/.config/nix/darwin/
```

## Update

```sh
nix flake update --commit-lock-file ~/.config/nix/darwin/
```

## TODO

### Nix

- [ ] Reorganize `flake.nix`
- [ ] Setup colortheme as variables
    - [ ] Alacritty
    - [ ] fzf
    - [ ] Starship
    - [ ] ...

### Programs

- [x] Alacritty
- [ ] Nushell
- [ ] Fish functions
- [x] Add kitty
    - [x] Configure in home manager
- [x] Zellij
- [x] Lazygit
- [x] btop
- [x] zsh
- [x] gpg
- [x] Use `backup` option
    - [x] tmux
    - [x] fish

#### Neovim

- [x] Set `conceallevel` to 1 or 2
- [x] Setup vim-sleuth for tabstops
- [x] Setup formatter
- [x] Setup/~disable~ spellcheck
- [x] Disable Obsidian (for now)

#### Starship

- [x] Implement `pure` style
