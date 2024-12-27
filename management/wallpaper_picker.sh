#!/usr/bin/env bash

# Directories and configurations
wall_dir="/home/eduardo/xaviduds/dotfiles/desktop/wallpapers"
cacheDir="${HOME}/.cache/jp/wallpapers"
current_wallpaper="/path/to/current/wallpaper" # Adjust as needed to track the currently set wallpaper
rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/wallSelect.rasi"

# Ensure cache directory exists
[ ! -d "${cacheDir}" ] && mkdir -p "${cacheDir}"

# Convert and cache images from all subdirectories
find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r imagen; do
    if [ -f "$imagen" ]; then
        nombre_archivo=$(basename "$imagen")
        cache_file="${cacheDir}/${nombre_archivo}"
        if [ ! -f "${cache_file}" ]; then
            magick "$imagen" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "${cache_file}"
        fi
    fi
done

# Use rofi to select wallpaper
wall_selection=$(find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A; do
    if [[ "$current_wallpaper" == *"$A" ]]; then
        echo -en "$A\x00icon\x1f${cacheDir}/$A\x1fselected\n"
    else
        echo -en "$A\x00icon\x1f${cacheDir}/$A\n"
    fi
done | $rofi_command)

# Exit if no selection is made
[[ -z "$wall_selection" ]] && exit 1

# Set the selected wallpaper using swww
selected_wall=$(find "${wall_dir}" -type f -name "${wall_selection}")
if [[ -n "$selected_wall" ]]; then
    # Save the currently selected wallpaper
    current_wallpaper="$selected_wall"
    swww img "$selected_wall"
else
    echo "Error: Selected wallpaper not found."
    exit 1
fi

exit 0

