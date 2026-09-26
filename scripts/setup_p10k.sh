#!/bin/bash

echo "🚀 Starting Powerlevel10k installation..."

# 1. Ensure Zsh, Git, and Brew are available
if ! command -v zsh &> /dev/null; then echo "❌ Zsh is missing."; exit 1; fi
if ! command -v git &> /dev/null; then echo "❌ Git is missing."; exit 1; fi
if ! command -v brew &> /dev/null; then echo "❌ Homebrew is missing."; exit 1; fi

# 2. Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 3. Clone Powerlevel10k theme
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "📥 Downloading Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

# 4. Update ~/.zshrc theme
ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
    cp "$ZSHRC" "$ZSHRC.bak"
    if grep -q "ZSH_THEME=" "$ZSHRC"; then
        sed -i '' 's|ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|g' "$ZSHRC"
    else
        echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
    fi
fi

# 5. Install Meslo Nerd Font via Homebrew Cask
echo "🔤 Installing Meslo Nerd Font via Homebrew..."
brew install --cask font-meslo-for-powerlevel10k

echo ""
echo "🎉 Installation complete!"
echo "👉 Next steps:"
echo "1. Set your Terminal/iTerm2 font to 'MesloLGS NF'."
echo "2. Run: source ~/.zshrc to start the configuration wizard."