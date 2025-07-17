#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use sudo or run as root user."
   exit 1
fi

# Declare installed package state
declare -A installed_packages
installed_packages=()

# Install menu
install_menu() {
    echo -e "\nWelcome to the installer! You can install useful Linux packages."
    echo "Available packages:"
    echo "1) htop"
    echo "2) figlet"
    echo "3) lolcat"
    echo "4) cowsay"
    echo "5) nano"
    echo "6) git"
    echo "7) wget"
    echo "8) curl"
    echo "9) unzip"
    echo "10) tree"
    read -p "Enter the number of the package to install: " pkg

    case "$pkg" in
        1) apt install -y htop && installed_packages[htop]=1 ;;
        2) apt install -y figlet && installed_packages[figlet]=1 ;;
        3) apt install -y lolcat && installed_packages[lolcat]=1 ;;
        4) apt install -y cowsay && installed_packages[cowsay]=1 ;;
        5) apt install -y nano && installed_packages[nano]=1 ;;
        6) apt install -y git && installed_packages[git]=1 ;;
        7) apt install -y wget && installed_packages[wget]=1 ;;
        8) apt install -y curl && installed_packages[curl]=1 ;;
        9) apt install -y unzip && installed_packages[unzip]=1 ;;
        10) apt install -y tree && installed_packages[tree]=1 ;;
        *) echo "Invalid package number." ;;
    esac
    echo "Install finished!"
}

# Main command loop
main() {
    while true; do
        echo -e "\nType a command:"
        echo "• install — install a package"
        echo "• [package name] — run it (if available)"
        echo "• list — show installed packages"
        echo "• exit — quit installer"
        read -p "> " input

        case "$input" in
            install)
                install_menu
                ;;
            list)
                echo "Installed packages:"
                for pkg in "${!installed_packages[@]}"; do
                    echo "• $pkg"
                done
                ;;
            exit)
                echo "Exiting installer."
                break
                ;;
            *)
                if [ "${installed_packages[$input]}" == "1" ]; then
                    echo "Launching $input..."
                    "$input"
                else
                    echo "Command '$input' not installed or unknown."
                fi
                ;;
        esac
    done
}

# Run initial install menu
install_menu
main
