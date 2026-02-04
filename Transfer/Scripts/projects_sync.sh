#!/bin/bash

echo "Notes Auto-Sync"
echo "===================="

vault_path="/home/tutu/mnt/Share/Projects/"

# Ask for vault path
read -p "Enter repo name: " repo_name

full_path="$vault_path$repo_name"

# Check if path exists
if [ ! -d "$full_path" ]; then
    echo "❌ Error: Path '$full_path' not found!"
    exit 1
fi

cd "$full_path"

echo "📦 Syncing $(basename "$full_path")..."

echo "⬇️  Pulling changes from GitHub..."
git pull origin main

# Git operations
git add .
git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

echo "Sync complete!"
