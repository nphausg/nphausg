# 2. Set your Git global details here
GIT_NAME="nphausg"
GIT_EMAIL="nphausg@gmail.com"

# ... (later in the script)

echo "⚙️ Configuring global Git settings..."
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
echo "✅ Git global username set to '$GIT_NAME'."
echo "✅ Git global email set to '$GIT_EMAIL'."
