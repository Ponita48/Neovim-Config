#!/usr/bin/env bash

set -e

echo "=== Installing LSP servers for Lua, Python, and Dart ==="

# ------------------------
# Python LSP (pylsp)
# ------------------------
echo "Installing Python LSP (pylsp)..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS: prefer pipx
    if command -v pipx >/dev/null 2>&1; then
        pipx install python-lsp-server[all] || pipx upgrade python-lsp-server[all]
    else
        echo "pipx not found, falling back to pip3..."
        if command -v pip3 >/dev/null 2>&1; then
            pip3 install --user 'python-lsp-server[all]'
        else
            echo "Error: pip3 not found. Please install pipx or pip3."
            exit 1
        fi
    fi
else
    # Linux: pip3 fallback
    if command -v pip3 >/dev/null 2>&1; then
        pip3 install --user 'python-lsp-server[all]'
    elif command -v pip >/dev/null 2>&1; then
        pip install --user 'python-lsp-server[all]'
    else
        echo "Error: pip not found. Please install Python and pip."
        exit 1
    fi
fi

# ------------------------
# Lua LSP (lua-language-server)
# ------------------------
echo "Installing Lua LSP (lua-language-server)..."
if command -v brew >/dev/null 2>&1; then
    brew install lua-language-server
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y lua-language-server
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm lua-language-server
    else
        echo "No supported package manager found. Please install lua-language-server manually."
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Homebrew not found. Please install Homebrew or lua-language-server manually."
    exit 1
else
    echo "Unsupported OS. Please install lua-language-server manually."
    exit 1
fi

# ------------------------
# Dart LSP (via Dart SDK)
# ------------------------
echo "Installing Dart SDK (includes Dart LSP)..."
if command -v brew >/dev/null 2>&1; then
    brew tap dart-lang/dart
    brew install dart
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y apt-transport-https wget gnupg
        wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
        sudo apt-get update && sudo apt-get install -y dart
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm dart
    else
        echo "Please install Dart SDK manually: https://dart.dev/get-dart"
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Homebrew not found. Please install Dart SDK manually."
    exit 1
else
    echo "Unsupported OS. Please install Dart SDK manually: https://dart.dev/get-dart"
    exit 1
fi

echo "=== Installation complete! ==="
echo "Now you can configure Neovim (or your editor) to use:"
echo "  - Python LSP: pylsp"
echo "  - Lua LSP: lua-language-server"
echo "  - Dart LSP: dart (built into Dart SDK)"

