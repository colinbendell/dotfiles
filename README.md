# Dotfiles

My personal dotfiles following the pattern of [dotfiles](https://github.com/makeyourownmaker/dotfiles) inspired by [atlassian](https://www.atlassian.com/git/tutorials/dotfiles)

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/colinbendell/dotfiles/main/setup.sh | bash
```

This will:

- Clone this dotfiles repository to `~/.dotfiles` and backup existing fiels (.zshrc, etc)
- Install oh-my-zsh and plugins
- Install oh-my-tmux
- Install Homebrew (macOS only)
- Set zsh as the default shell
