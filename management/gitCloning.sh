#!/bin/sh

HOME_DIR="/home/eduardo"

# List of repositories to check and clone
REPOS="lince-social/lince lince-social/experimental lince-social/desktop xaviduds/dotfiles xaviduds/lince"

for REPO in $REPOS; do
    # Extract the owner and repository name
    OWNER=$(dirname "$REPO")
    REPO_NAME=$(basename "$REPO")
    
    # Full path to the owner directory
    OWNER_DIR="$HOME_DIR/$OWNER"
    
    # Full path to the repository directory
    REPO_DIR="$OWNER_DIR/$REPO_NAME"
    
    # Create the owner directory if it doesn't exist
    if [ ! -d "$OWNER_DIR" ]; then
        echo "Creating owner directory: $OWNER_DIR"
        mkdir -p "$OWNER_DIR"
    fi
    
    # Check if the repository directory exists
    if [ ! -d "$REPO_DIR" ]; then
        # If it doesn't exist, clone the repository
        echo "Cloning $REPO into $REPO_DIR..."
        git clone "git@github.com:$REPO.git" "$REPO_DIR"
    else
        # If it exists, notify the user
        echo "$REPO_DIR already exists. Skipping..."
    fi
done
