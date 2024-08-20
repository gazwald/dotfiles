# dotfiles

Bootstrapping a new system:

## Prerequisites

- git
- stow

### Fedora

```bash
sudo dnf install git stow
```

### Mac

- [Brew](https://brew.sh/)

```zsh
brew install git stow
```

## Installation

```bash
git clone git@github.com:gazwald/dotfiles.git && cd dotfiles && stow .
```

## Packages

```bash
~/dotfiles/system_setup/packages/install_common
```
