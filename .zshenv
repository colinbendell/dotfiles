export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"


[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh # added by Nix installer

[[ -d /boot/dietpi ]] && export PATH=/usr/bin:/boot/dietpi:/bin:/usr/sbin:/sbin:$PATH

# HOMEBREW
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# RANCHER DESKTOP
[[ -d $HOME/.rd/bin ]] && export PATH="$HOME/.rd/bin:$PATH"

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
