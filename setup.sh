#!/usr/bin/env sh
cd $HOME
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

curl_install() {
  local name="$1"
  local install_path="$2"
  local url="$3"

  if [ -e "$install_path" ]; then
    echo "SKIP: $name"
  else
    sh -c "$(curl -fsSL $url)" "" --unattended
    echo "✅ $name"
  fi
}

git_clone() {
  local name="$1"
  local repo_url="$2"
  local install_path="$3"

  if [ -d "$install_path" ]; then
    echo "SKIP: $name"
  else
    git clone --single-branch --depth=1 "$repo_url" "$install_path"
    echo "✅ $name"
  fi
}

# Install oh-my-zsh
curl_install "Oh My Zsh" $HOME/.oh-my-zsh "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

# Install zsh plugins and themes
git_clone "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions" "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git_clone "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git_clone "zsh-bat" "https://github.com/fdellwing/zsh-bat.git" "$ZSH_CUSTOM/plugins/zsh-bat"
git_clone "you-should-use" "https://github.com/MichaelAquilina/zsh-you-should-use.git" "$ZSH_CUSTOM/plugins/you-should-use"
git_clone "powerlevel10k" "https://github.com/romkatv/powerlevel10k.git" "$ZSH_CUSTOM/themes/powerlevel10k"

git_clone "oh-my-tmux" "https://github.com/gpakosz/.tmux.git" "$HOME/.tmux"
if [ ! -f "$HOME/.tmux.conf" ]; then
  ln -s -f .tmux/.tmux.conf
  echo "✅ linking tmux.conf"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Install packages via Homebrew (macOS only)
  curl_install "Homebrew" "/opt/homebrew/bin/brew" "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

  if [ -f "Brewfile" ]; then
    echo "✅ Homebrew packages"
    brew bundle
  fi
fi
