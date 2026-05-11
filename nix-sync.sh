#!/usr/bin/env sh

# 1. Sync Desktop entries and Icons
echo "   Syncing Nix apps and icons to local share..."
mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/icons

# Remove old broken links first to keep it clean
find ~/.local/share/applications -xtype l -delete
find ~/.local/share/icons -xtype l -delete

# Create fresh links
ln -sf ~/.nix-profile/share/applications/*.desktop ~/.local/share/applications/ 2>/dev/null
ln -sf ~/.nix-profile/share/icons/hicolor/* ~/.local/share/icons/ 2>/dev/null

echo "   Sync complete."

# 2. Ask to Update
printf "\n   Update all Nix packages? (y/N): "
read -r update_ans
if [ "$update_ans" = "y" ] || [ "$update_ans" = "Y" ]; then
    echo "   Updating..."
    # Added --impure here to allow the UNFREE environment variable to work
    NIXPKGS_ALLOW_UNFREE=1 nix profile upgrade --all --impure
fi

# 3. Ask to Cleanup
printf "\n   Run Nix cleanup and optimization? (y/N): "
read -r clean_ans
if [ "$clean_ans" = "y" ] || [ "$clean_ans" = "Y" ]; then
    echo "   Collecting garbage..."
    nix-collect-garbage -d
    echo "   Optimizing store (hard-linking)..."
    nix-store --optimize
    echo "   System lean and clean."
fi

echo "\n   All done!"
