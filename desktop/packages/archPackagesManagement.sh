# #!/bin/bash
#
# yay -Syu
#
# # Define the file name
# FILE="/home/eduardo/xaviduds/dotfiles/desktop/packages/archPackages.txt"
#
# # Check if the file exists
# if [[ ! -f "$FILE" ]]; then
#     echo "Error: $FILE not found!"
#     exit 1
# fi
#
# # Sort the file and process each line
# echo "Sorted packages:"
# sort "$FILE" | while IFS= read -r package; do
#     # Skip empty lines
#     if [[ -z "$package" ]]; then
#         continue
#     fi
#
#     # Print the package name
#     echo "$package"
# done
#!/bin/bash

FILE="archPackages.txt"

# Function to display usage
usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -a, --add <package>    Add a package to the list"
    echo "  -r, --remove <package> Remove a package from the list"
    echo "  -l, --list             List all packages in the file"
    echo "  -i, --install          Install all packages listed in the file"
    echo "  -c, --check            Check explicitly installed packages and update the file"
    echo "  -d, --delete-orphans   Delete orphan packages"
    echo "  -h, --help             Show this help message"
    exit 1
}

# Function to add a package
add_package() {
    local package="$1"
    if grep -Fxq "$package" "$FILE"; then
        echo "Package '$package' already exists in the list."
    else
        echo "$package" >> "$FILE"
        echo "Package '$package' added to the list."
    fi
}

# Function to remove a package
remove_package() {
    local package="$1"
    if grep -Fxq "$package" "$FILE"; then
        sed -i "/^$package$/d" "$FILE"
        echo "Package '$package' removed from the list."
    else
        echo "Package '$package' not found in the list."
    fi
}

# Function to list packages
list_packages() {
    if [[ -f "$FILE" ]]; then
        echo "Packages in $FILE:"
        sort "$FILE" | while IFS= read -r package; do
            echo "- $package"
        done
    else
        echo "No packages found in $FILE."
    fi
}

# Function to install packages
install_packages() {
    if [[ ! -f "$FILE" ]]; then
        echo "Error: $FILE not found!"
        exit 1
    fi

    echo "Installing packages from $FILE..."
    sudo pacman -S --needed - < "$FILE"
}

# Function to check explicitly installed packages and update the file
check_explicit_packages() {
    echo "Checking explicitly installed packages..."
    pacman -Qqe > "$FILE"
    echo "Explicitly installed packages have been saved to $FILE."
}

# Function to delete orphan packages
delete_orphans() {
    echo "Deleting orphan packages..."
    sudo pacman -Rns $(pacman -Qdtq)
    echo "Orphan packages deleted."
}

# Main script logic
if [[ $# -eq 0 ]]; then
    usage
fi

# Parse options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -a|--add)
            if [[ -z "$2" ]]; then
                echo "Error: Package name not provided."
                usage
            fi
            add_package "$2"
            shift 2
            ;;
        -r|--remove)
            if [[ -z "$2" ]]; then
                echo "Error: Package name not provided."
                usage
            fi
            remove_package "$2"
            shift 2
            ;;
        -l|--list)
            list_packages
            shift
            ;;
        -i|--install)
            install_packages
            shift
            ;;
        -c|--check)
            check_explicit_packages
            shift
            ;;
        -d|--delete-orphans)
            delete_orphans
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Error: Unknown option '$1'."
            usage
            ;;
    esac
done
