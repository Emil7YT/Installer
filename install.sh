#!/bin/bash

# Store installed packages
declare -A installed_packages
installed_packages=()

install_menu() {
    echo -e "Welcome to the installer. Here you can install packages, games, Linux distros, etc."
    echo "!NOTICE! Only packages work (in development)"
    echo "What do you want to install?"
    echo "1) Packages"
    echo "2) Games"
    echo "3) Linux distro"
    echo "4) Other"
    read -p "> " installation

    if [ "$installation" == "1" ]; then
        clear
        echo "Available packages:"
        echo "1) system"
        echo "2) info"
        echo "3) htop"
        echo "4) neofetch"
        echo "5) figlet"
        echo "6) lolcat"
        echo "7) cowsay"
        echo "8) nano"
        echo "9) git"
        echo "10) wget"
        echo "Type the number of the package:"
        read -p "> " pkg

        case "$pkg" in
            1) echo "Installing system..."; sleep 1; installed_packages[system]=1 ;;
            2) echo "Installing info..."; sleep 1; installed_packages[info]=1 ;;
            3) echo "Installing htop..."; sleep 1; installed_packages[htop]=1 ;;
            4) echo "Installing neofetch..."; sleep 1; installed_packages[neofetch]=1 ;;
            5) echo "Installing figlet..."; sleep 1; installed_packages[figlet]=1 ;;
            6) echo "Installing lolcat..."; sleep 1; installed_packages[lolcat]=1 ;;
            7) echo "Installing cowsay..."; sleep 1; installed_packages[cowsay]=1 ;;
            8) echo "Installing nano..."; sleep 1; installed_packages[nano]=1 ;;
            9) echo "Installing git..."; sleep 1; installed_packages[git]=1 ;;
            10) echo "Installing wget..."; sleep 1; installed_packages[wget]=1 ;;
            *) echo "Invalid option" ;;
        esac
        echo "Install finished!"
    elif [ "$installation" == "2" ]; then
        echo "Games in development..."
    elif [ "$installation" == "3" ]; then
        echo "Linux distros coming soon..."
    elif [ "$installation" == "4" ]; then
        echo "Contact the owner for custom installs."
    else
        echo "Invalid choice."
    fi
}

main() {
    while true; do
        read -p "> " input

        case "$input" in
            "install")
                install_menu
                ;;
            "system")
                if [ "${installed_packages[system]}" == "1" ]; then
                    echo "Displaying system ASCII art..."
                    echo "Device: $(hostname)"
                    echo "OS: $(uname -o)"
                else
                    echo "System package not installed."
                fi
                ;;
            "info")
                if [ "${installed_packages[info]}" == "1" ]; then
                    echo "Made by Tozter_1 with love :>"
                else
                    echo "Info package not installed."
                fi
                ;;
            "exit")
                echo "Exiting installer."
                break
                ;;
            *)
                if [ "${installed_packages[$input]}" == "1" ]; then
                    echo "$input package is installed but has no extra actions yet."
                else
                    echo "Unknown command or package not installed."
                fi
                ;;
        esac
    done
}

install_menu
main
