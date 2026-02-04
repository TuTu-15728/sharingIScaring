#!/bin/bash
echo "Notes Auto-Sync"
echo "──── ୨୧ ──── ୨୧ ──── ୨୧ ────"

# Get the directory where the script is located
# script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
script_dir="/home/tutu/mnt/Share/Notes"
echo "🔍 Scanning for Git repositories in: $script_dir"

# Counter for synced repos
synced_count=0
skipped_count=0

# Find all directories that are Git repositories
for dir in "$script_dir"/*; do
    if [ -d "$dir" ] && [ -d "$dir/.git" ]; then
        echo ""
        echo "⏳ Checking: $(basename "$dir")"
        echo "===================="
        
        # Check git status
        cd "$dir"
        status_output=$(git status --porcelain)
        
        if [ -z "$status_output" ]; then
            echo "✘ Nothing to commit - skipping"
            ((skipped_count++))
        else
            echo "⇄ Changes detected - syncing..."
            echo "⬇️ Pulling changes from GitHub..."
            echo ""
            git pull origin main
            
            # Git operations
            git add .
            git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"
            git push origin main
            
            echo "Sync complete for $(basename "$dir")"
            ((synced_count++))
        fi
    fi
done

echo ""
echo "──── ୨୧ ──── ୨୧ ──── ୨୧ ────"
echo "📊 Sync Summary:"
echo "ꪜ Synced repositories: $synced_count"
echo "⏭️ Skipped repositories: $skipped_count"
echo "👌 All done!"