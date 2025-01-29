#!/bin/bash

FILE="/home/eduardo/xaviduds/dotfiles/desktop/packages/archPackages.txt"

# Function to tidy the file (sort and remove duplicates)
tidy_file() {
    if [[ -f "$FILE" ]]; then
        sort -u "$FILE" -o "$FILE"
    fi
}

# Function to display the menu
show_menu() {
    echo "===================================="
    echo " Arch Linux Package Manager Helper  "
    echo "===================================="
    echo "a. Add a package, install all needed"
    echo "r. Remove a package"
    echo "0. Exit"
    echo "===================================="
}

# Function to add a package (or multiple packages)

remove_package() {
    echo "Enter the package name(s) to remove (separated by spaces):"
    read -r package_input

    # Split the input into individual packages
    IFS=' ' read -r -a packages <<< "$package_input"

    for package in "${packages[@]}"; do
        if grep -Fxq "$package" "$FILE"; then
            sed -i "/^$package$/d" "$FILE"
            echo "Package '$package' removed from the list."
            yay -Rs "$package" --noconfirm
        else
            echo "Package '$package' not found in the list."
        fi
    done
    sleep 2
}

# Function to list packages
list_packages() {
    if [[ -f "$FILE" ]]; then
        sorted_packages=$(sort "$FILE" | tr '\n' ' ')
        echo "$sorted_packages"
    else
        echo "No packages found in $FILE."
    fi
}

# Function to install packages
install_packages() {
    if [[ ! -f "$FILE" ]]; then
        echo "Error: $FILE not found!"
        sleep 2
        return
    fi

    echo "Installing packages from $FILE..."
    yay -S --noconfirm --needed - < "$FILE"
    echo "Press enter to continue..."
    read -r
}

add_package() {
    echo "Enter the package name(s) to add (separated by spaces):"
    read -r package_input

    # Split the input into individual packages
    IFS=' ' read -r -a packages <<< "$package_input"

    for package in "${packages[@]}"; do
        if grep -Fxq "$package" "$FILE"; then
            echo "Package '$package' already exists in the list."
        else
            echo "$package" >> "$FILE"
            echo "Package '$package' added to the list."
        fi
    done
    sleep 2
    install_packages
}


# Function to check explicitly installed packages
check_explicit_packages() {
    echo "Checking explicitly installed packages..."
    pacman -Qqe >> "$FILE"  # Append instead of overwrite
}

# Function to delete orphan packages
delete_orphans() {
    echo "Deleting orphan packages..."
    sudo pacman -Rns $(pacman -Qdtq)
}

# Main loop
while true; do
    # Update the package list and remove orphans
    check_explicit_packages
    delete_orphans

    # Tidy the file (sort and remove duplicates)
    tidy_file

    # Clear the screen and show the current packages
    clear
    list_packages
    echo ""

    # Show the menu
    show_menu

    # Get user input
    read -r choice

    case $choice in
        a) add_package ;;
        r) remove_package ;;
        0) exit 0 ;;
        *) echo "Invalid option. Press Enter to continue..." ;;
    esac
done
