#!/bin/bash

# 1. Define aliases as an array of "name=command" pairs
ALIASES=(
    'brewup=brew update && brew upgrade && brew cleanup && brew doctor'
    'yoclaude=claude --dangerously-skip-permissions'
)

ZSHRC="$HOME/.zshrc"

echo "⚙️ Setting up shell aliases..."

# Ensure .zshrc exists
touch "$ZSHRC"

# Loop through the array and add aliases if they don't already exist
for item in "${ALIASES[@]}"; do
    name="${item%%=*}"
    cmd="${item#*=}"
    alias_line="alias $name=\"$cmd\""

    if grep -qF "alias $name=" "$ZSHRC"; then
        echo "ℹ️ Alias '$name' already exists in $ZSHRC."
    else
        echo "" >> "$ZSHRC"
        echo "# Custom alias: $name" >> "$ZSHRC"
        echo "$alias_line" >> "$ZSHRC"
        echo "✅ Added '$name' alias to $ZSHRC."
    fi
done

echo ""
echo "🎉 Setup complete! Run the following command to apply your changes:"
echo "   source ~/.zshrc"
