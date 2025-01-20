#!/bin/bash

# Set directories
SOURCE_DIR="dunno"
DEST_DIR="./"
SHADER_FILE="shader.glsl"

# Loop until the source directory is empty
while [ "$(ls -A $SOURCE_DIR)" ]; do
    # Pick a random file from the source directory
    FILE=$(ls "$SOURCE_DIR" | shuf -n 1)

    # Move the file to the current directory
    mv "$SOURCE_DIR/$FILE" "$DEST_DIR"

    # Copy the file to shader.glsl
    cp "$DEST_DIR/$FILE" "$SHADER_FILE"

    # Ask the user to classify the file
    echo "Processing file: $FILE"
    echo "Rate the shader:"
    echo "1: good"
    echo "2: neutral"
    echo "3: bad"
    echo "4: fodamasnao"
    read -p "Enter your choice (1, 2, 3, or 4): " CHOICE

    # Define directories for classification
    case $CHOICE in
        1) TARGET_DIR="good" ;;
        2) TARGET_DIR="neutral" ;;
        3) TARGET_DIR="bad" ;;
        4) TARGET_DIR="fodamasnao" ;;
        *) echo "Invalid choice. Skipping file."; rm "$SHADER_FILE"; continue ;;
    esac

    # Create target directory if it doesn't exist
    mkdir -p "$TARGET_DIR"

    # Move shader.glsl to the selected directory
    mv "$SHADER_FILE" "$TARGET_DIR"

    # Move the original file to the target directory
    mv "$DEST_DIR/$FILE" "$TARGET_DIR"

    echo "File $FILE moved to $TARGET_DIR."
done

echo "No more files in $SOURCE_DIR."

