#!/usr/bin/env sh
cd $HOME

# Install oh-my-zsh
echo "Installing Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh is already installed. Skipping installation."
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "Oh My Zsh installed successfully."
fi

# Install zsh-autosuggestions
echo "Installing the zsh-autosuggestions plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "zsh-autosuggestions is already installed. Skipping installation."
else
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "zsh-autosuggestions installed successfully."
fi

# Install zsh-syntax-highlighting
echo "Installing the zsh-syntax-highlighting plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "zsh-syntax-highlighting is already installed. Skipping installation."
else
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "zsh-syntax-highlighting installed successfully."
fi

# Install powerlevel10k
echo "Installing the powerlevel10k plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/powerlevel10k" ]; then
  echo "powerlevel10k is already installed. Skipping installation."
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo "powerlevel10k installed successfully."
fi

# Install zsh-bat
echo "Installing the zsh-bat plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-bat" ]; then
  echo "zsh-bat is already installed. Skipping installation."
else
  git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/zsh-bat
  echo "zsh-bat installed successfully."
fi

# Install you-should-use
echo "Installing the you-should-use plugin..."
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use" ]; then
  echo "you-should-use is already installed. Skipping installation."
else
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/you-should-use
  echo "you-should-use installed successfully."
fi

# Install you-should-use
echo "Installing the oh-my-tmux..."
if [ -d "$HOME/.tmux" ]; then
  echo "oh-my-tmux is already installed. Skipping installation."
else
  git clone --single-branch https://github.com/gpakosz/.tmux.git $HOME/.tmux
  ln -s -f .tmux/.tmux.conf

  echo "oh-my-tmux installed successfully."
fi

if [ -f "Brewfile" ]; then
  brew bundle
fi