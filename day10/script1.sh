#!/bin/bash

<<Comment
Check if a package is installed; install it if not. 
Comment

if [ -z "$1" ]; then
    echo "Usage: $0 <package-name>"
    exit 1
fi

PACKAGE="$1"

# Check whether package is installed
if dpkg -s "$PACKAGE" &>/dev/null; then
    echo "$PACKAGE is already installed."
else
    echo "$PACKAGE is not installed."
    echo "Installing $PACKAGE..."

    sudo apt update
    sudo apt install -y "$PACKAGE"

    if [ $? -eq 0 ]; then
        echo "$PACKAGE installed successfully."
    else
        echo "Failed to install $PACKAGE."
        exit 1
    fi
fi
