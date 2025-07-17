#!/bin/bash

if ! command -v apt &> /dev/null; then
    echo "❌ This script only works on APT-based systems like Ubuntu or Debian."
    exit 1
fi

if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  Please run this script as root (use: sudo ./tozter-os.sh)"
    exit 1
fi

myint1=0
myint2=0

clear
echo -e "\e[1;35m████████╗ ██████╗ ███████╗████████╗███████╗██████╗  ██████╗ ███████╗\e[0m"
echo -e "\e[1;35m╚══██╔══╝██╔═══██╗╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗██╔═══██╗██╔════╝\e[0m"
echo -e "\e[1;35m   ██║   ██║   ██║  ███╔╝    ██║   █████╗  ██████╔╝██║   ██║███████╗\e[0m"
echo -e "\e[1;35m   ██║   ██║   ██║ ███╔╝     ██║   ██╔══╝  ██╔══██╗██║   ██║╚════██║\e[0m"
echo -e "\e[1;35m   ██║   ╚██████╔╝███████╗   ██║   ███████╗██║  ██║╚██████╔╝███████║\e[0m"
echo -e "\e[1;35m   ╚═╝    ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝\e[0m"
echo -e "                \e[1;37mWelcome to Tozter OS Installer v0.1 (Ubuntu Shell Edition)\e[0m"
echo -e "\n\e[33mNote: Only 'Packages' currently works. Other features in development.\e[0m\n"

sleep 1

# Main menu
echo "What do you want to install?"
echo "1) Packages"
echo "2) Games"
echo "3) Linux Distro"
echo "4) Other"
read -p "> " installation

# Package option
if [ "$installation" == "1" ]; then
    clear
    echo "Available packages to install:"
    echo "1) System Tools (htop, neofetch, curl)"
    echo "2) Info Package (just a message for now)"
    read -p "Choose one > " pkg

    if [ "$pkg" == "1" ]; then
        echo "Installing System Tools..."
        sleep 1
        apt update && apt install -y htop neofetch curl
        myint1=1
        echo "✅ System tools installed."
    elif [ "$pkg" == "2" ]; then
        echo "Installing Info Package..."
        sleep 1
        myint2=1
        echo "✅ Info package installed."
    else
        echo "❌ Invalid package choice."
    fi

elif [ "$installation" == "2" ]; then
    clear
    echo "🎮 Games module is coming soon. Restart Tozter OS."

elif [ "$installation" == "3" ]; then
    clear
    echo "🐧 Linux distro downloader is in development."

elif [ "$installation" == "4" ]; then
    clear
    echo "📩 Contact Tozter_1 for custom scripts."

else
    echo "❌ Invalid selection. Restart Tozter OS."
    exit 1
fi

# Start pseudo-shell
main() {
    echo -e "\n\e[1;32mTozterOS Shell — type a command (system, info, exit, or Linux commands):\e[0m"
    while true; do
        read -p "TozterOS> " input

        if [ "$input" == "neofetch" ]; then
            if [ "$myint1" == 1 ]; then
                neofetch || echo "neofetch not available"
            else
                echo "⚠️  System tools not installed."
            fi

        elif [ "$input" == "info" ]; then
            if [ "$myint2" == 1 ]; then
                echo -e "💡 Tozter OS made with ❤️ by Tozter_1"
            else
                echo "⚠️  Info package not installed."
            fi

        elif [ "$input" == "exit" ]; then
            echo "👋 Exiting Tozter OS Shell. See you soon!"
            break

        else
            echo -e "🔧 Executing: $input\n"
            eval "$input"
        fi
    done
}

main
