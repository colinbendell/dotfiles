[[ -d /boot/dietpi ]] && /boot/dietpi/dietpi-login
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# history
# setopt histignorealldups sharehistory
export HISTSIZE=100000
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=$HISTSIZE # This will save history for next sessions
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don\'t record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don\'t record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don\'t write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

#ENV
export ZSH=$HOME/.oh-my-zsh
export DEVDIR=$HOME/src

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

#
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
#
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
#
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
#
# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"
#
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
#
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true
#
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
#
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
#
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
#
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"
#
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# Autostart tmux on each terminal
# ZSH_TMUX_AUTOSTART=true
#
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
#    autojump
    command-not-found
    common-aliases
    docker
    docker-compose
    git-extras
    git-flow
    history
    httpie
    npm
    pip
    ssh-agent
    #sudo
    you-should-use
    zsh-bat
    z
)

[[ "$OSTYPE" == "darwin"* ]] && plugins+=(macos brew)

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#if whence dircolors >/dev/null; then
#  eval "$(dircolors -b)"
#  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#  alias ls='ls --color'
#else
#  export CLICOLOR=1
#  zstyle ':completion:*:default' list-colors ''
#fi
#
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

## zsh-history-substring-search configuration
HISTORY_SUBSTRING_SEARCH_FUZZY=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Hide the user from the prompt
DEFAULT_USER=$USER

# Shorten the folder breadcrumbs
# ~/my/extremely/long/fumbled/path becomes ~/my/e/l/f/path
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

zstyle :omz:plugins:ssh-agent lazy-load yes
zstyle :omz:plugins:ssh-agent lifetime 1h

[[ "$OSTYPE" == "darwin"* ]] && zstyle ':omz:plugins:ssh-agent' ssh-add-args --apple-load-keychain
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autojump
#[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

[ -f ~/.local/try.rb ] && eval "$(~/.local/try.rb init ~/src/tries)"

# NVM / FNM
[ -f "$(which fnm)" ] && alias nvm="fnm"
[ -f "$(which fnm)" ] && eval "$(fnm --version-file-strategy=recursive --log-level=quiet env --use-on-cd --shell zsh)"

# orb stack
[[ -f  ~/.orbstack/shell/init.zsh ]] && source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# DOTFILES
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Prune git branches
alias gitprune="git fetch --all --prune && git branch -vv | awk '/: gone]/{print \$1}' | xargs git branch -D"

# GNU Date
[ -f "$(which gdate)" ] &&  alias date=gdate

alias cls=clear #because dos
alias watch=viddy

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
