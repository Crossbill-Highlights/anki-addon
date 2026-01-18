#!/bin/bash

# Detect the operating system
OS=$(uname -s)

# Set the destination path based on the OS
if [ "$OS" = "Linux" ]; then
    DEST_DIR="$HOME/.local/share/Anki2/addons21/crossbill"
elif [ "$OS" = "Darwin" ]; then
    DEST_DIR="$HOME/Library/Application Support/Anki2/addons21/crossbill"
else
    echo "Unsupported operating system: $OS"
    echo "This script supports Linux and macOS only."
    exit 1
fi

echo "Installing Crossbill addon to: $DEST_DIR"

# Backup meta.json if it exists
META_JSON="$DEST_DIR/meta.json"
TEMP_META="/tmp/crossbill_meta.json.bak"
if [ -f "$META_JSON" ]; then
    echo "Backing up settings file..."
    cp "$META_JSON" "$TEMP_META"
fi

# Remove existing addon directory if it exists
if [ -d "$DEST_DIR" ]; then
    echo "Removing existing addon directory..."
    rm -rf "$DEST_DIR"
fi

# Copy the addon to the destination
echo "Copying addon files..."
cp -r . "$DEST_DIR"

# Restore meta.json if it was backed up
if [ -f "$TEMP_META" ]; then
    echo "Restoring settings file..."
    cp "$TEMP_META" "$META_JSON"
    rm "$TEMP_META"
fi

echo "Installation complete!"
echo "Please restart Anki to load the addon."
